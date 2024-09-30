#!/bin/bash

# 1.
sudo apt -y update

# 2.
sudo apt -y install apt-transport-https ca-certificates wget gnupg

# 3.
sudo install -m 0755 -d /etc/apt/keyrings && \
    wget -qO- https://repos.ripple.com/repos/api/gpg/key/public | \
    sudo gpg --dearmor -o /etc/apt/keyrings/ripple.gpg

# 4.
# gpg --show-keys /etc/apt/keyrings/ripple.gpg
# pub   rsa3072 2019-02-14 [SC] [expires: 2026-02-17]
#     C0010EC205B35A3310DC90DE395F97FFCCAFD9A2
# uid           TechOps Team at Ripple <techops+rippled@ripple.com>
# sub   rsa3072 2019-02-14 [E] [expires: 2026-02-17]

# 5.
echo "deb [signed-by=/etc/apt/keyrings/ripple.gpg] https://repos.ripple.com/repos/rippled-deb bookworm stable" | \
    sudo tee -a /etc/apt/sources.list.d/ripple.list

# 6.
sudo apt -y update && sudo apt -y install rippled

