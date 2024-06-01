function norm -d "Starting the norminette in the subfolders"
	norminette -R CheckForbiddenSourceHeader -R CheckDefine ./*/*.h ./*/*.c
end

function norw -d "Starting the norminette in the subfolders with watch"
	norw=watch -n 0.5 norminette -R CheckForbiddenSourceHeader -R CheckDefine ./*/*.h ./*/*.c
end
