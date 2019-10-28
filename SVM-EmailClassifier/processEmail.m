function word_indices = processEmail(email_contents)

% Load Vocabulary
vocabList = getVocabList();

word_indices = [];

email_contents = lower(email_contents);
email_contents = regexprep(email_contents, '<[^<>]+>', ' ');
email_contents = regexprep(email_contents, '[0-9]+', 'number');
email_contents = regexprep(email_contents, ...
                           '(http|https)://[^\s]*', 'httpaddr');
email_contents = regexprep(email_contents, '[^\s]+@[^\s]+', 'emailaddr');

% Handle $ sign
email_contents = regexprep(email_contents, '[$]+', 'dollar');

% Output the email to screen as well
fprintf('\n==== Processed Email ====\n\n');
fprintf('%s',email_contents)

% Process file
l = 0;

while ~isempty(email_contents)

    [str, email_contents] = ...
       strtok(email_contents, ...
              [' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);
   
    % Remove any non alphanumeric characters
    str = regexprep(str, '[^a-zA-Z0-9]', '');

    try str = porterStemmer(strtrim(str)); 
    catch str = ''; continue;
    end;

    % Skip the word if it is too short
    if length(str) < 1
       continue;
    end

 
	for i = 1:length(vocabList)
		if (strcmp(vocabList{i},str))
			word_indices = [word_indices ;i];
		end
	end


   if (l + length(str) + 1) > 78
        fprintf('\n');
        l = 0;
    end
    fprintf('%s ', str);
    l = l + length(str) + 1;

end
fprintf('\n\n=========================\n');

end
