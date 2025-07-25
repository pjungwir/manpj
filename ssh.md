Set up forwarding so you can connect via a bastion host.

For example to set up ssh:

    ssh -L 9022:distantip:22 bastionlogin@bastionbox
    ssh -p 9022 distantlogin@localhost

Or to set up psql:

    ssh -L 15432:distantip:5432 bastionlogin@bastionbox
    psql -h localhost:15432

To set up your own private ngrok (forwarding requests to a remote host to your local host):

    ssh -R :3001:127.0.0.1:3000 example.com

You will need to set `GatewayPorts` to `yes` in the `sshd_config`.

If you only need to bind to the remote machine's localhost, this is safer:

    ssh -R 3001:127.0.0.1:3000 example.com

This will listen on example.com:3001 and forward requests to 127.0.0.1:3000 (where 127.0.0.1 is your local client machine).

To load an ssh key into your current bash session:

    ssh-add ~/.ssh/id_rsa

To run just one command with a given ssh key:

    ssh-agent bash -c 'ssh-add ~/.ssh/id_rsa; git clone git@github.com:foo/bar'

On my Xubuntu desktop, ssh-agent starts automatically only when you login at the console.
If you login remotely, you need to say this:

    eval $(ssh-agent -s) && ssh-add

If you too much ssh keys in your ssh agent:

    ssh -o IdentitiesOnly=yes -i ~/.ssh/the-right-key root@host

To just use a password:

    ssh -o PubkeyAuthentication=no root@host
