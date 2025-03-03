# SMBClient Cheat Sheet

## Connection
### Anonymous/Guest Access
```bash
smbclient //IP/public -N
```
### Authenticated Access
```bash
smbclient //IP/C$ -U admin%pass123456
```
### Specify Domain/Workgroup
```bash
smbclient //IP/Share -W CORP -U user%pass
```

---

## File Operations
### Download a File
```bash
smbclient //IP/Data -U user%pass -c "get file.docx"
```
### Upload All TXT Files
```bash
smbclient //IP/Data -U user%pass -c "mask *.txt; recurse; mput *.txt"
```
### Delete a File
```bash
smbclient //IP/Data -U user%pass -c "rm oldfile.zip"
```

---

## Directory Management
### Create a Directory
```bash
smbclient //IP/Data -U user%pass -c "mkdir Projects"
```
### Recursive Download
```bash
smbclient //IP/Data -U user%pass -c "recurse; prompt; mget *"
```

---

## Non-Interactive Mode
### List Shares via Script
```bash
smbclient -L IP -U admin%Password123456 -N -I IP
```
### Backup Directory to Tar
```bash
smbclient //IP/Backup -U user%pass -c "tar c backup.tar Documents"
```

---

## Advanced Techniques
### Mounting Shares (Linux)
```bash
sudo mount -t cifs //IP/Data /mnt/share -o user=admin,pass=Pass123456
```
### Brute-Force Share Names
Combine with tools like `nmap` or `enum4linux`:
```bash
enum4linux -S IP
```

---

## Using a Credentials File
### Create `credentials.txt`:
```
username = admin
password = Pass123456
domain = CORP
```
### Use Credentials File with smbclient
```bash
smbclient //IP/C$ -A credentials.txt
```

---

## Example Shell Script: List SMB Shares
```bash
#!/bin/bash

# Variables
TARGET_IP="$1"      # Target IP address
USERNAME="admin"    # SMB Username
PASSWORD="Password123" # SMB Password

# Check for target IP
if [ -z "$TARGET_IP" ]; then
    echo "Usage: $0 <target_IP>"
    exit 1
fi

# Run smbclient to list shares
echo "Listing SMB shares on $TARGET_IP..."
smbclient -L "$TARGET_IP" -U "$USERNAME%$PASSWORD" -N -I "$TARGET_IP"

# Check command status
if [ $? -eq 0 ]; then
    echo "SMB shares listed successfully."
else
    echo "Failed to list SMB shares on $TARGET_IP."
fi
```
### Save, Make Executable, and Run
```bash
sudo vim list_smb_shares.sh
chmod +x list_smb_shares.sh
./list_smb_shares.sh <IP_CIBLE>
```
### Verify Port 445 Open
```bash
nmap -p 445 <IP_Cible>
```

---

## References
- [smbclient Man Page](https://www.samba.org/samba/docs/current/man-html/smbclient.1.html)
- [github noobosaurus-r3x](https://github.com/noobosaurus-r3x/Cheat-sheets/blob/main/SMBClient%20Cheat%20Sheet.md)
