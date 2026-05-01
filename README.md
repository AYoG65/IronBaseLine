# IronBaseLine 

A cross-platform CIS Benchmark Level 1 hardening framework for Windows and Linux systems. Supports audit, harden, and rollback modes — designed to be safe enough to run in production environments without causing outages.

---

## Overview

Most systems ship with insecure defaults. IronBaseLine automates the process of bringing Windows and Linux hosts into alignment with CIS Benchmark Level 1 controls — the industry-standard baseline for enterprise security hardening used in SOC 2, HIPAA, and FedRAMP compliant environments.

Rather than a one-shot script that locks down a system and leaves no way back, IronBaseLine gives you three modes: **audit** (check without changing), **harden** (apply controls), and **rollback** (revert if needed). This makes it safe to test in staging before pushing to production.

---

## Supported Platforms

| Platform | CIS Benchmark | Status |
|---|---|---|
| Windows 10 / 11 | CIS Microsoft Windows 10/11 L1 | ✅ Supported |
| Windows Server 2019 | CIS Microsoft Windows Server 2019 L1 | ✅ Supported |
| Windows Server 2022 | CIS Microsoft Windows Server 2022 L1 | ✅ Supported |
| Ubuntu 20.04 / 22.04 | CIS Ubuntu Linux L1 | ✅ Supported |
| RHEL 8 / 9 | CIS Red Hat Enterprise Linux L1 | ✅ Supported |

---

## Modes

### `--audit`
Scans the system against CIS Level 1 controls and reports pass/fail for each check. **No changes are made.** Use this to assess current compliance posture before hardening.

### `--harden`
Applies all CIS Level 1 controls to the system. Backs up original configuration before making any changes so rollback is always possible.

### `--rollback`
Reverts the system to its pre-hardening state using the backup created during the harden phase. Use this if a hardening control causes an unexpected issue in your environment.

---

## What Gets Hardened

### Windows
- Account policies — password complexity, length, lockout thresholds
- Audit policies — logon events, privilege use, object access
- User rights assignments — restrict remote access, deny guest logon
- Security options — UAC configuration, SMB signing, NTLMv2 enforcement
- Windows Firewall — profile enforcement, inbound/outbound default rules
- Disable unnecessary services — Telnet, FTP, Remote Registry, etc.
- Registry hardening — disable autorun, restrict anonymous access, enable DEP

### Linux
- Filesystem — disable unused filesystems (cramfs, freevxfs, jffs2, etc.)
- SSH hardening — disable root login, enforce key auth, set idle timeout
- Password policies — complexity, aging, history via PAM
- Auditd configuration — log privilege escalation, file access, system calls
- Network hardening — disable IP forwarding, ICMP redirects, source routing
- Cron and at restrictions — limit to authorized users only
- Syslog configuration — ensure remote logging is configured

---

## Repository Structure

```
IronBaseLine/
├── windows/               # PowerShell hardening scripts for Windows
├── linux/                 # Bash hardening scripts for Linux/RHEL/Ubuntu
├── config/                # CIS control configuration files per platform
├── docs/                  # Supporting documentation and control references
├── .gitignore
├── LICENSE
└── README.md
```

---

## Usage

### Windows (run as Administrator in PowerShell)

```powershell
# Audit only — no changes made
.\windows\IronBaseLine.ps1 --audit

# Apply CIS Level 1 hardening
.\windows\IronBaseLine.ps1 --harden

# Rollback to pre-hardening state
.\windows\IronBaseLine.ps1 --rollback
```

### Linux (run as root or with sudo)

```bash
# Audit only — no changes made
sudo bash linux/ironbaseline.sh --audit

# Apply CIS Level 1 hardening
sudo bash linux/ironbaseline.sh --harden

# Rollback to pre-hardening state
sudo bash linux/ironbaseline.sh --rollback
```

---

## Sample Audit Output

```
[IronBaseLine] Starting CIS Level 1 Audit — Ubuntu 22.04
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[PASS] 1.1.1  Ensure mounting of cramfs filesystems is disabled
[PASS] 1.1.2  Ensure mounting of freevxfs filesystems is disabled
[FAIL] 1.4.1  Ensure permissions on bootloader config are configured
[PASS] 2.2.1  Ensure NIS server is not installed
[FAIL] 3.1.1  Ensure IP forwarding is disabled
[PASS] 4.2.1  Ensure rsyslog is installed
[FAIL] 5.2.4  Ensure SSH Protocol is set to 2
[PASS] 6.1.2  Ensure permissions on /etc/passwd are configured

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[IronBaseLine] Audit complete: 5 passed · 3 failed · 0 errors
[IronBaseLine] Run with --harden to remediate failed controls
```

---

## Prerequisites

### Windows
- PowerShell 5.1 or later
- Run as Administrator
- Windows 10 / 11 or Windows Server 2019 / 2022

### Linux
- Bash 4.0+
- Root or sudo access
- `auditd` installed (for audit logging controls)

---

## Important Notes

- **Always run `--audit` first** before hardening any production system
- **Test in a non-production environment** before deploying to live systems
- Some CIS controls may impact application behavior — review the docs/ folder for known conflicts
- The rollback feature requires the backup created during `--harden` to be present — do not delete it until you have verified stability

---

## Real-World Context

CIS Level 1 hardening is a baseline requirement in SOC 2, HIPAA, FedRAMP, and PCI-DSS compliant environments. Organizations running cloud infrastructure on Azure, AWS, or GCP are increasingly required to demonstrate OS-level hardening as part of their security posture. IronBaseLine automates what would otherwise be a manual, error-prone process across a fleet of servers.

---

## Future Enhancements

- CIS Level 2 controls support
- HTML compliance report output
- Ansible playbook wrapper for fleet-wide deployment
- Azure Policy integration for cloud VM compliance enforcement
- GitHub Actions workflow for automated compliance scanning in CI/CD

---

## Topics

`cis-benchmark` `hardening` `security` `powershell` `bash` `linux` `windows` `windows-server` `compliance` `soc2` `devsecops` `sysadmin` `automation`
