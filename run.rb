file = "repo"
contents = File.read(file)

if contents.include?("agora")
	File.open(file, 'w') { |file| file.write("ok") }
	system "git checkout bbt"
	system "git add ."
	system "git commit -m 'commit'"
	system "git pull"
	system "git push origin bbt"
end