clc;clear all;
A=xlsread('overhead.xlsx');
overhead_rapl = A(:,3);
avg_rapl=sum(overhead_rapl)/25
overhead_counter = A(:,5);
avg_counter=sum(overhead_counter)/25
overhead_rapl=rmmissing(overhead_rapl);
overhead_counter=rmmissing(overhead_counter);
y=[overhead_rapl overhead_counter];
x=categorical({'aobench','encode-mp3','amg','botan','gmpbench','coremark','glibc-bench','himeno',...
    'openssl','byte','jpegxl','libraw','luxcorerender','lzbench','gnupg','basis','git','php','pybench','java-jmh',...
    'blogbench','fio','tiobench','unpack-linux','postmark'});
x=reordercats(x,{'aobench','encode-mp3','amg','botan','gmpbench','coremark','glibc-bench','himeno',...
    'openssl','byte','jpegxl','libraw','luxcorerender','lzbench','gnupg','basis','git','php','pybench','java-jmh',...
    'blogbench','fio','tiobench','unpack-linux','postmark'});
figure(1);
C=bar(x,y);
C(1).FaceColor = 'b';
C(2).FaceColor = 'r';
%legend('RAPL: Energy Consumption','Performance Counter');
hold on;
y_rapl=avg_rapl*ones(size(x));
plot(x,y_rapl,'--b'); 
y_counter=avg_counter*ones(size(x));
plot(x,y_counter,'--r');
legend('RAPL: Energy Consumption','Performance Counter','RAPL: Avg Overhead',...
    'Performance Counter: Avg Overhead')
(avg_counter-avg_rapl)/avg_counter