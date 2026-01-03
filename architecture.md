# Architecture

IronBaseline uses OS-specific scripts driven by YAML baseline configurations.
Scripts are idempotent and generate compliance output.

Flow:
1. Load baseline
2. Audit system
3. Apply hardening
4. Report results
