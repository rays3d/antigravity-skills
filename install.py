#!/usr/bin/env python3
"""
Antigravity Skills Installer
Installs skills into Google Antigravity IDE (Global) or a local project.
Supports filtering by stack: Flutter, Laravel, React, or All (and combinations).
"""

import argparse
import json
import os
import shutil
import sys

def get_base_dir():
    return os.path.dirname(os.path.abspath(__file__))

def load_manifest():
    manifest_path = os.path.join(get_base_dir(), 'skills.json')
    if not os.path.exists(manifest_path):
        print(f"Error: Manifest not found at {manifest_path}", file=sys.stderr)
        sys.exit(1)
    with open(manifest_path, 'r', encoding='utf-8') as f:
        return json.load(f)

def get_global_skills_dir():
    home = os.path.expanduser("~")
    return os.path.join(home, ".gemini", "config", "skills")

def get_project_skills_dir(project_path):
    abs_project = os.path.abspath(project_path)
    return os.path.join(abs_project, ".agent", "skills")

def print_skill_list(manifest):
    print("=" * 70)
    print(" Google Antigravity Agent Skills Catalog")
    print("=" * 70)
    total = 0
    for stack_key, stack_data in manifest.get('stacks', {}).items():
        skills = stack_data.get('skills', [])
        total += len(skills)
        print(f"\n[{stack_data.get('name')}] ({len(skills)} skills)")
        print(f"Description: {stack_data.get('description')}")
        print("-" * 70)
        for s in sorted(skills):
            print(f"  - {s}")
    print("\n" + "=" * 70)
    print(f" Total Canonical Skills: {total}")
    print("=" * 70)

def resolve_skills_to_install(manifest, selected_stacks, stack_only=False):
    stacks = manifest.get('stacks', {})
    
    if "all" in selected_stacks:
        skills = set()
        for s_data in stacks.values():
            skills.update(s_data.get('skills', []))
        return sorted(list(skills))

    skills = set()
    include_common = False

    for s_key in selected_stacks:
        if s_key not in stacks:
            print(f"Error: Unknown stack '{s_key}'. Available: all, flutter, laravel, react, common", file=sys.stderr)
            sys.exit(1)
        skills.update(stacks[s_key].get('skills', []))
        if s_key in ('flutter', 'laravel', 'react'):
            include_common = True

    if not stack_only and include_common:
        skills.update(stacks.get('common', {}).get('skills', []))

    return sorted(list(skills))

def install_skills(skill_names, target_dir, dry_run=False):
    source_base = os.path.join(get_base_dir(), 'skills')
    if not os.path.exists(source_base):
        print(f"Error: Source skills directory not found at {source_base}", file=sys.stderr)
        sys.exit(1)

    print(f"\nTarget Destination: {target_dir}")
    print(f"Skills to install: {len(skill_names)}")
    if dry_run:
        print("[DRY-RUN MODE: No files will be modified]\n")

    installed_count = 0
    for name in skill_names:
        src = os.path.join(source_base, name)
        dst = os.path.join(target_dir, name)
        if not os.path.exists(src):
            print(f"  [MISSING] Source skill '{name}' not found at {src}!", file=sys.stderr)
            continue

        if dry_run:
            print(f"  [PLAN] Copy {name} -> {dst}")
        else:
            os.makedirs(target_dir, exist_ok=True)
            if os.path.exists(dst):
                shutil.rmtree(dst)
            shutil.copytree(src, dst)
            print(f"  [OK] Installed {name}")
        installed_count += 1

    if dry_run:
        print(f"\nDry run complete. {installed_count} skills planned for installation.")
    else:
        print(f"\nSuccess! {installed_count} skills successfully installed to {target_dir}")

def main():
    parser = argparse.ArgumentParser(
        description="Install Antigravity AI skills globally to your IDE or locally to a project."
    )
    parser.add_argument(
        "--list", "-l", action="store_true", help="List all available skills by stack and exit."
    )
    
    # Destination options
    dest_group = parser.add_mutually_exclusive_group()
    dest_group.add_argument(
        "--global", "-g", "--ide", dest="is_global", action="store_true",
        help="Install skills globally to Antigravity IDE configuration (~/.gemini/config/skills)."
    )
    dest_group.add_argument(
        "--project", "-p", metavar="PATH", nargs="?", const=".", default=None,
        help="Install skills to a specific project (.agent/skills). Defaults to current directory if PATH is omitted."
    )

    # Stack options (multi-selection supported)
    parser.add_argument(
        "--stack", action="append", default=[],
        help="Select stack(s) to install (all, flutter, laravel, react, common). Can be specified multiple times or comma-separated."
    )
    parser.add_argument("--flutter", action="store_true", help="Install Flutter skills.")
    parser.add_argument("--laravel", action="store_true", help="Install Laravel & PHP skills.")
    parser.add_argument("--react", action="store_true", help="Install React 19 skills.")
    parser.add_argument("--all", action="store_true", help="Install all skills across all stacks.")
    parser.add_argument("--common", action="store_true", help="Install only common workflow skills.")

    parser.add_argument(
        "--stack-only", action="store_true",
        help="When installing a specific stack, do NOT include common workflow skills."
    )
    parser.add_argument(
        "--dry-run", action="store_true", help="Preview the installation without writing any files."
    )

    args = parser.parse_args()
    manifest = load_manifest()

    if args.list:
        print_skill_list(manifest)
        return

    # Determine selected stacks
    selected_stacks = set()
    if args.all:
        selected_stacks = {"all"}
    else:
        if args.flutter: selected_stacks.add("flutter")
        if args.laravel: selected_stacks.add("laravel")
        if args.react: selected_stacks.add("react")
        if args.common: selected_stacks.add("common")
        for s_val in args.stack:
            for part in s_val.split(","):
                part = part.strip().lower()
                if part:
                    selected_stacks.add(part)

    if not selected_stacks or "all" in selected_stacks:
        selected_stacks = {"all"}

    # Determine target directory
    if args.is_global:
        target_dir = get_global_skills_dir()
    elif args.project is not None:
        target_dir = get_project_skills_dir(args.project)
    else:
        print("No target specified (--global or --project). Defaulting to IDE Global configuration.")
        target_dir = get_global_skills_dir()

    skills_to_install = resolve_skills_to_install(manifest, selected_stacks, stack_only=args.stack_only)
    install_skills(skills_to_install, target_dir, dry_run=args.dry_run)

if __name__ == "__main__":
    main()
