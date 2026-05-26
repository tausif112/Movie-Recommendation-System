% ===== Static Facts =====

% movie(MovieName, Genre, Director).
movie(blade_runner, scifi, ridley_scott).
movie(inception, scifi, nolan).
movie(godfather, drama, coppola).
movie(pulp_fiction, crime, tarantino).
movie(amelie, romance, jeunet).
movie(interstellar, scifi, nolan).
movie(dark_knight, action, nolan).

% ===== User Preferences =====

% prefers_genre(User, Genre).
prefers_genre(user_a, scifi).
prefers_genre(user_a, drama).
prefers_genre(user_b, crime).
prefers_genre(user_b, romance).

% prefers_director(User, Director).
prefers_director(user_a, nolan).
prefers_director(user_b, tarantino).

% ===== Ratings =====
% rating(User, Movie, RatingValue).
rating(user_a, blade_runner, 5).
rating(user_a, inception, 4).
rating(user_a, godfather, 3).      % Added shared rating with user_c

rating(user_b, pulp_fiction, 5).
rating(user_b, amelie, 3).
rating(user_b, inception, 4).      % Added shared rating with user_a

rating(user_c, godfather, 4).
rating(user_c, interstellar, 5).
rating(user_c, dark_knight, 4).
rating(user_c, inception, 5).      % Added shared rating with user_a

% ===== Utility Rules =====

% Recommend by genre
recommend_genre(User, Movie) :-
    prefers_genre(User, Genre),
    movie(Movie, Genre, _).

% Recommend by director
recommend_director(User, Movie) :-
    prefers_director(User, Director),
    movie(Movie, _, Director).

% Safe rating similarity check
rating_similarity(User1, User2, Movie, Similarity) :-
    rating(User1, Movie, R1),
    rating(User2, Movie, R2),
    Similarity is abs(R1 - R2), !.
rating_similarity(User1, User2, Movie, _) :-
    \+ (rating(User1, Movie, _), rating(User2, Movie, _)),
    format('No common rating found for movie "~w" between ~w and ~w.~n', [Movie, User1, User2]),
    fail.

% Shared movies between two users
shared_movies(User1, User2, Movies) :-
    findall(Movie, (rating(User1, Movie, _), rating(User2, Movie, _)), Movies).

% Safe average similarity check
average_similarity(User1, User2, Avg) :-
    shared_movies(User1, User2, Movies),
    Movies \= [],
    findall(Sim,
            (member(M, Movies),
             rating_similarity(User1, User2, M, Sim)),
            Sims),
    sum_list(Sims, Total),
    length(Sims, Count),
    Count > 0,
    Avg is Total / Count, !.
average_similarity(User1, User2, _) :-
    \+ (shared_movies(User1, User2, Movies), Movies \= []),
    format('No shared rated movies between ~w and ~w.~n', [User1, User2]),
    fail.

% Collaborative recommendation (similar users)
recommend_collaborative(User, Movie) :-
    rating(OtherUser, Movie, Rating),
    OtherUser \= User,
    Rating >= 4,
    average_similarity(User, OtherUser, AvgDiff),
    AvgDiff =< 1.5.

% High-level recommendation (may have duplicates)
recommend(User, Movie) :-
    recommend_genre(User, Movie).
recommend(User, Movie) :-
    recommend_director(User, Movie).
recommend(User, Movie) :-
    recommend_collaborative(User, Movie).

% No-duplicate recommendations
recommend_no_duplicates(User, Movie) :-
    setof(M, recommend(User, M), Movies),
    member(Movie, Movies).
