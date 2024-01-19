%It is possible to do all of the following input at the command line. Here
%we combine them into a single script file to enable testing of the basics
%of Matlab. Please test each line by typing at the command line. Look into
%the workspace items.

a = 2; %Note how the semicolon means the command line output is suppressed.
b = 2*a-1 %Without the semicolon, we print out the calculation result to command line.

x = pi

y = sin(x)

a = [3 2 4.2]

b = [1 0 1]' %The apostrophe creates a transpose of the matrix

a*b

b*a

a.b

b.a

a.a

A = [2 -1 0; -1 2 -1; 0 -1 2]

x = A*b

x = 0:0.25:1

y = 0:.1:pi

%Let's also see how to perform simple mathematical operations using for
%loops and to allocate memory ahead for vectorization.

x = 0:0.25:1;

y = zeros(1,numel(x)); %Input defining zeros for y is not necessary, however, allocating the memory for the array speeds up Matlab.

for i=1:numel(x)
    y(i) = x(i)^2 + 1
end

%The preceding for loop may be further simplified with vector
%multiplication.

x = 0:0.25:1;

x^2

x.^2

y = x.^2 + 1;