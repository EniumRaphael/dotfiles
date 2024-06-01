function ga -d "Adding files to the repo"
	if [ -z $argv ]
		git add .
	else
		git add $argv
	end
end

function gcl -d "Clone the repo"
	git clone $argv
end

function gs -d "Show the status of the repo"
	git status $args
end

function gm -d "Comment the changes to the repo"
	if [ -z $argv ]
		git commit -m "I'll learn to do commit \!"
	else
		git commit -m $argv
	end
end

function gc -d "Comment the changes to the repo"
	if [ -z $argv ]
		git commit -m "I'll learn to do commit \!"
	else
		git commit -m $argv
	end
end

function gp -d "Push the changes to the repo"
	git push $argv
end

function gpp -d "Pull the changes from the repo"
	git pull $argv
end

function gr -d "Restore the changes from the repo"
	if [ -z $argv ]
		git restore .
	else
		git restore $argv
	end
end
