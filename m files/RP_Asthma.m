close all;

if (size(data, 2) == 1)
    data = transpose(data);
end

SD = std(data);
mean1 = mean(data);
etp_pos = find( (data > mean1 + 3 * SD) | (data < mean1 - 3 * SD) );

data_tmp = data;
data(etp_pos) = NaN;
data_tmp(etp_pos) = mean1;
data = [data; data_tmp];
data = knnimpute(data);
data = data(1,:);
% plot(data);
saveplot = strcat(D_asthDATA, slash, 'HRV_Figure', slash, patient_name, slash, record_name, '.jpg');
saveas(gcf, saveplot);

kk = data;

% NN = size(kk,1);
% dmsn_tmp = fnn(kk,30);
%
% t=1:30;
% y=dmsn_tmp;
% dy=gradient(y,t);
% % subplot(2,1,1);
% % plot(t,y);
% % subplot(2,1,2);
% % plot(t,dy);

% dmsn = find(abs(dy) < 1e-3, 1, 'first')-1;
<<<<<<< HEAD
dmsn = 5;
midelay = mi(kk, 10, size(kk,2), 'silent');

for ii = 1: size(data,2)
    if ((midelay(1, 1, ii) < midelay(1, 1,ii+1)) && (midelay(1, 1, ii) < midelay(1, 1, ii-1)))
=======

kk = data;
midelay = mi(kk, 20, length(kk));
for ii = 1:200-1
    if ((midelay(1, 1, ii) < midelay(1, 1,ii+1)) && (midelay(1, 1, ii) > midelay(1, 1, ii-1)))
>>>>>>> f48dcab8d6696698ab8ed249b1f766259b847d5e
        checkt = ii;
        break;
    end;
end;
%
tdelay = checkt;

% [maxd, tmp] = pss(kk, dmsn, 5);
% eps = 0.1 * maxd;
<<<<<<< HEAD
thres = 0.1;

tt = crqa(kk, 5, tdelay, thres, length(kk), 1, 'fan', 'nogui', 'silent');

close all;
R = crp(data, 5, tdelay, 0.1, 'fan', 'nogui', 'silent');
spy_tmtb(R);
saveplot = strcat(D_asthDATA, slash, 'Recurrence Plot', slash, patient_name, slash, record_name, '.jpg');
saveas(gcf, saveplot);
=======
dmsn = 5;
tt = crqa(kk, 5, tdelay, 0.1, length(kk), 1, 'fan', 'nogui');

>>>>>>> f48dcab8d6696698ab8ed249b1f766259b847d5e
%         -----------------------------------
severity_tmp = record_name(26:27);
switch severity_tmp
    case 'C0'
        severity = 'NORMAL';
    case 'C1'
        severity = 'MILD/ MODERATE';
    case 'C2'
        severity = 'ACUTE/ SEVERE';
    case 'C3'
        severity = 'LIFE THREATENING';
end;

FILE = fopen(output, 'a');
fprintf(FILE, '%s \t', record_name);
<<<<<<< HEAD
fprintf(FILE, '%s \t %d \t %s \t %d \t %d \t %3.2f \t', wderr, length(kk), severity, dmsn, tdelay, thres);
=======
fprintf(FILE, '%d \t %d \t %d \t %d \t %3.2f \t', length(kk), wderr, dmsn, tdelay, 0.1 * length(kk));
>>>>>>> f48dcab8d6696698ab8ed249b1f766259b847d5e
fprintf(FILE, '%d \t', tt);
fprintf(FILE, '\n');
fclose(FILE);
%         -----------------------------------
