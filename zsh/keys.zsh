# Remove the hosts that I don't want to keep around- in this case, only
# keep the first host. Like a boss.
alias hosts="head -2 ~/.ssh/known_hosts | tail -1 > ~/.ssh/known_hosts"

# Pipe my public key to my clipboard. 
alias pubkey="xclip -selection c -i ~/.ssh/id_rsa.pub | echo '=> Public key copied to pasteboard.'"


function ssh-copy-id() {
	echo 'usage: ssh-copy-id user@host';
	cat ~/.ssh/id_rsa.pub | ssh $1 'cat >> .ssh/authorized_keys'
}

function ssh-copy-id-with-key() {
	echo 'usage: ssh-copy-id-with-key path-to-key user@host';
	cat ~/.ssh/id_rsa.pub | ssh -i $1 $2 'cat >> .ssh/authorized_keys'
}

function ssh-copy-key() {
	echo 'usage: ssh-copy-key path-to-someones-key user@host';
	cat $1 | ssh $2 'cat >> .ssh/authorized_keys'
}
