# THU-OpenClaw-Skill

This repository is the central monorepo containing various skills developed by the THU-NMRC team for OpenClaw.

## Available Skills

* [**gsdata-skill**](./gsdata-skill/): A skill for accessing the GSData (清博智能) Open Platform for public sentiment, account rankings, and NLP queries.

## Usage

Each skill resides in its own isolated directory complete with its own `SKILL.md` and dependencies. 
To install a specific skill into your OpenClaw agent, refer to the README.md within each subfolder.

Example installation pattern:
```bash
clawhub install github:thu-nmrc/THU-OpenClaw-Skill/<skill-folder-name>
```
