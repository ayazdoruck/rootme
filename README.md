# RootMe: Termux Environment Provisioning Script

**Description:**
RootMe is an automation utility designed to deploy and orchestrate a Kali Linux environment within the Termux ecosystem using `proot` abstraction. It facilitates a seamless, rootless virtualization layer, allowing for the execution of advanced penetration testing tools on Android devices without compromising system integrity.

---

## Key Capabilities

* **Automated Provisioning:** Streamlined deployment of dependencies, core packages, and the Kali Linux filesystem.
* **Dual Operational Modes:**
    * **Boot2Root:** Persistent initialization that launches the Kali environment automatically upon terminal startup.
    * **OnlyRoot:** On-demand execution via the `rootme` command for specialized workflows.
* **Configuration Redundancy:** Automatic backup of the existing `bash.bashrc` to ensure rapid system recovery and rollback capability.
* **Mock Environment Simulation:** A dedicated `--test` flag for developers to validate script logic on non-Android Linux/WSL distributions.
* **Pre-flight Connectivity Validation:** Integrated network status checks to prevent installation failures due to unstable repository access.

## Prerequisites

* **Platform:** Termux (Android Terminal Emulator).
* **Network:** Stable internet connectivity for remote package fetching.
* **Storage:** Minimum of 2GB available disk space (Recommended).

## Installation and Implementation

Execute the following command sequence to initialize the environment:

1. **Synchronize Package Repositories:**
   ```bash
   pkg update && pkg upgrade
   ```

2. **Fetch the Source Script:**
   ```bash
   wget https://raw.githubusercontent.com/AyazDoruck/rootme/main/rootme.sh
   ```

3. **Modify Execution Permissions:**
   ```bash
   chmod +x rootme.sh
   ```

4. **Execute the Provisioning Script:**
   ```bash
   ./rootme.sh
   ```

5. **Post-Installation:** Restart the Termux session to apply the environmental changes and configuration updates.

## Troubleshooting and Maintenance

* **Restoring Default Configuration:** If a rollback is required, restore the original shell configuration using the generated backup:
    ```bash
    cp $PREFIX/etc/bash.bashrc.bak $PREFIX/etc/bash.bashrc
    ```
* **Development Testing:** To simulate the deployment logic on a standard Linux workstation:
    ```bash
    ./rootme.sh --test
    ```

## Contributions and Support

Contributions regarding performance optimization or feature enhancements are welcome via Pull Requests. For bug reports, please utilize the repository's Issue tracker.

**Developer:** ayazdoruck
**Contact:** [Instagram/@ayazdoruck](https://www.instagram.com/ayazdoruck/)  
*Disclaimer: This project is intended for educational purposes and ethical security research.*