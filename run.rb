def commit
	system "git add ."
	system "git commit -m 'commit'"
	system "git push origin bbt"
end


while(1<2)
	file_repo = "repo"

	puts "reading file"

	begin

		system "git reset --hard"
		system "git checkout bbt"
		system "git pull"

		begin
			system "mkdir teste"
		rescue;end

		sleep(10)
		contents = File.read(file_repo)

		if contents.include?("agora")
			File.open(file_repo, 'w') { |file| file.write("ok #{Time.now}") }
			#bate e cria log
			File.open("teste/file-#{Time.now.strftime("%d-%m-%Y-%h%m-%s")}", 'w') { |file| file.write("data alterada em #{Time.now}") }
			commit
		elsif contents.include?("preview")
			File.open(file_repo, 'w') { |file| file.write("ok #{Time.now}") }
			#somente verifica sem bater
			File.open("teste/preview-#{Time.now.strftime("%d-%m-%Y-%h%m-%s")}", 'w') { |file| file.write("data alterada preview em #{Time.now}") }
			commit
		end
			

		puts "fininsh"

	rescue Exception => err
		puts "ERRO: #{err.message} - #{err.backtrace}"
	end
end