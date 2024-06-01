function mc
	if test (count $argv) -eq 0
		echo "Usage: mc [init | start | restart | console | logs | stop]"
		return
	else
		switch $argv[1]
			case init
				sudo docker run --init -d -v /home/raphael/minecraft_server:/data -e TYPE=PAPER -e MEMORY=6G -e OPS=Zeldraft -p 25565:25565 -e EULA=TRUE --name mc itzg/minecraft-server
			case start
				sudo docker start mc
			case restart
				sudo docker restart mc
			case logs
				sudo docker logs -f mc
			case console
				sudo docker exec -i mc rcon-cli
			case stop
				sudo docker stop mc
			case *
				echo "Usage: mc [init | start | restart | console | logs | stop]"
			end
	end
end

function mcc
	sudo docker exec -i mc rcon-cli
end
