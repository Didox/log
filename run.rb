file = "repo"
while(1<2)
	puts "reading file"

	begin

		system "git reset --hard"
		system "git checkout bbt"
		system "git pull"

		sleep(10)
		contents = File.read(file)

		if contents.include?("agora")
			File.open(file, 'w') { |file| file.write("ok #{Time.now}") }
			File.open("teste/ddd-#{Time.now.to_i}", 'w') { |file| file.write("ok #{Time.now}") }

			system "git add ."
			system "git commit -m 'commit'"
			system "git push origin bbt"

			puts "push success"
		end

		puts "fininsh"

	rescue Exception => err
		puts "ERRO: #{err.message}"
	end
end