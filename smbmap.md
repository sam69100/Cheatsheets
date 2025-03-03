# SMBMap Cheat Sheet

## Null Session (Guest Access)
```bash
smbmap -u '' -p '' -d . -H IP
```

## Authenticated Access
```bash
smbmap -u admin -p '123456' -d WORKGROUP -H IP
```

---

## Share Enumeration
### List All Shares
```bash
smbmap -H IP
```
### Check Specific Share
```bash
smbmap -H IP -s 'C$'
```
### Check Shares with Full Permissions
```bash
smbmap -H IP -R
```

---

## File Operations
### Download a File
```bash
smbmap -u admin -p '123456' -H IP --download 'C$\private.txt'
```
### Upload a File
```bash
smbmap -u admin -p '123456' -H IP --upload '/tmp/payload.exe' 'C$\Windows\Temp\payload.exe'
```
### Recursive Directory Listing
```bash
smbmap -u guest -p '' -H IP -R 'Documents'
```

---

## Command Execution
### Run a Command (example: `whoami`)
```bash
smbmap -u admin -p '123456' -H IP -x 'whoami'
```
### Execute a PowerShell Script
```bash
smbmap -u admin -p '123456' -H IP -x 'powershell -c "Get-Process"'
```

---

## User & Permission Checks
### Enumerate Users
```bash
smbmap -H IP --users
```
### Check Admin Access
```bash
smbmap -u admin -p '123456' -H IP --admin
```

---

## Advanced Techniques
### Port Redirection (Target non-standard SMB port, e.g., 8445)
```bash
smbmap -H IP -P 8445
```
### Read-Only Checks (Check if shares are writable)
```bash
smbmap -u guest -p '' -H IP --no-write-check
```

---

## Enum4Linux Commands
### Full Scan (Equivalent to all options)
```bash
enum4linux -a IP
```
### List Users
```bash
enum4linux -U IP
```
### List Available Shares
```bash
enum4linux -S IP
```

---

## SMB Enumeration with Nmap
### Scan SMB Shares and Users
```bash
nmap -p 445 --script=smb-enum-shares,smb-enum-users IP
```
### Common SMB Scripts
- **smb-enum-shares**: Lists SMB shares.
- **smb-enum-users**: Lists SMB users.
- **smb-os-discovery**: Detects OS details.

### Complete SMB Scan
```bash
nmap -p 139,445 --script smb-* IP
```

---

## SMBClient Usage
### List SMB Shares
```bash
smbclient -L //IP -U <username>
```
If no username/password is required:
```bash
smbclient -L //IP -N
```

### Connect to a Share
```bash
smbclient //IP/<share_name> -U <username>
```
Without a password:
```bash
smbclient //IP/<share_name> -N
```

### Useful Commands in SMBClient
- `ls`: List files and directories.
- `get <file>`: Download a file.
- `put <file>`: Upload a file.
- `exit`: Quit smbclient.

---

## Mount SMB Share Locally
### Mount Command
```bash
sudo mount.cifs //IP/<share_name> /mount/point -o username=<username>
```
Without a password:
```bash
sudo mount.cifs //IP/<share_name> /mount/point -o guest
```

---

## Example Workflow

1. **Discover with Enum4Linux**
   ```bash
   enum4linux -a IP
   ```

2. **Scan with Nmap**
   ```bash
   nmap -p 139,445 --script=smb-enum-shares,smb-enum-users IP
   ```

3. **List Shares with SMBClient**
   ```bash
   smbclient -L //IP -N
   ```

4. **Connect to a Share**
   ```bash
   smbclient //IP/share_name -U user
   ```

5. **Mount Locally**
   ```bash
   sudo mount.cifs //IP/share_name /mnt/share -o username=user
   ```

With these commands, you can perform complete discovery and interact with SMB shares on a network.

---

## References
- [SMBMap GitHub Repository](https://github.com/ShawnDEvans/smbmap)
- [Enum4Linux GitHub Repository](https://github.com/noobosaurus-r3x/)
