function vocabList = getVocabList()
fid = fopen('vocab.txt');

n = 1899;  % Total number of words in the dictionary

vocabList = cell(n, 1);
for i = 1:n
    % Word Index
    fscanf(fid, '%d', 1);
    vocabList{i} = fscanf(fid, '%s', 1);
end
fclose(fid);

end
