require './rot13'
polecenie = ""
zaladowano_tekst = false
tekst = ""
 until polecenie == "QUIT"
 	polecenie, *parametry = gets.chomp.split(" ")
 	if polecenie == "LOAD"
 		File.open(parametry[0], 'r') do |plik|
 			tekst = Rot13.encode(plik.read)
 			zaladowano_tekst = true
 		end
 	else
 		if zaladowano_tekst == false
 			puts "Błąd. Nie wybrano pliku."
 		elsif polecenie == "DECODE"
 			puts tekst
 		elsif polecenie == "REPLACE"
 			tekst.gsub!(parametry[0], parametry[1])
 		elsif polecenie == "SAVE"
 			File.open(parametry[0], 'w') do |plik|
 				tekst = Rot13.decode(tekst)
 				plik << tekst
 			end
 		end
 	end
 end