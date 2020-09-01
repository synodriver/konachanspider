url="http://konachan.com/post?page=";
options=weboptions("UserAgent",...
"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/18.17763",...
"RequestMethod","get","Timeout",10);
%/post/show/\d{6}/(:?\w|-|_)+
count=1;
for i=1:9  % 页数
    html=webread(url+num2str(i)+"&tags=footjob",options);
    lianjie=regexp(html,"/post/show/\d{6}/(:?\w|-|_)+","match");
    for j=1:length(lianjie)
        new_url="http://konachan.com"+lianjie{j};  %进入分页
        html_new=webread(new_url,options);
        tu=regexp(html_new,"https://konachan.com/\S{50,500}\.jpg","match");
        disp(tu{1});
        A=webread(tu{1},options);
        imwrite(A,num2str(count)+".png");
        count=count+1;
    end
end




