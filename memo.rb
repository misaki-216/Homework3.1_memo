
require "csv"

puts "1(新規でメモを作成) 2(既存のメモを編集する) 3(終了する)"

memo_type = gets.chomp

if memo_type == "1"
  puts "拡張子を除いたファイルを入力してください"
  
  file_name = gets.chomp
  
  puts "メモしたい内容を記入してください"
  puts "完了したらcontrol+Dを押して保存してください"
  
  memo_type = $stdin.read
  
  CSV.open("#{file_name}.csv", 'w') do |memo|
    memo << ["#{memo_type}"]
  end

  
elsif memo_type =="2"
  puts "編集したいファイル名を選んでください(拡張子除く)"
  
  file_name = gets.chomp
  
  memo_record = CSV.read("#{file_name}.csv")
  puts memo_record
  puts "-------"
  puts "a(メモを書き足す) b(メモを書き直す)"
  
  memo_type = gets.chomp
  
  if memo_type=="a"
    puts "追加内容を記入してください"
    puts "完了したらcontrol+Dを押して保存してください"
    
    memo_type = $stdin.read
  
  CSV.open("#{file_name}.csv", 'a') do |memo|
    memo << ["#{memo_type}"]
  end
  
  elsif memo_type=="b"
    puts "メモ内容を記入してください"
    puts "完了したらcontrol+Dを押して保存してください"
    
    memo_type = $stdin.read

CSV.open("#{file_name}.csv", 'w') do |memo|
    memo << ["#{memo_type}"]
   end
  
  else
    puts "対象外の文字が入力されました"
  end
  
elsif memo_type == "3"
  puts "メモアプリを終了しました"
  
else
  puts "1・2・3 のいずれかを押してください"
end


