/* 4. To determine length of a list using your own number system, that does not contain
more than two symbols. */
% Number system:
% Alphabet: 0, s (successor function)

length1([],0).
length1([X|Rest],s(N)):-length1(Rest,N).