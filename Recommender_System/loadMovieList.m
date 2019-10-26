function movieList = loadMovieList()

fid = fopen('movie_ids.txt');

n = 1682;  % Total number of movies 

movieList = cell(n, 1);
for i = 1:n
    line = fgets(fid);
    % Word Index (can ignore since it will be = i)
    [idx, movieName] = strtok(line, ' ');
    % Actual Word
    movieList{i} = strtrim(movieName);
end
fclose(fid);

end
