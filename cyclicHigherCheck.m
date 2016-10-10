% Checks surrounding elements if there is one element that is
% one higher than the element with index i, j. If at maxState
% element then check if surrounding elements is a zero.
% The range of the neighbourhood is defined by the range parameter.
function ishiger = cyclicHigherCheck(grid, i, j, maxState, range, sprial)
ishiger = 0;
for x = i-range:i+range
    for y = j-range:j+range
        % Normal state check
        if (grid(i,j) ~= maxState)
            if (grid(x,y) == grid(i,j)+1)
                ishiger = 1;
                return;
            end
        % Special case at max state
        else
            if (sprial == 1)
                if (grid(x,y) == 1); % creates sprial
                    ishiger = 1;
                    return;
                end
            end
            if (sprial == 2) 
                if (grid(x,y) > 0) % sprial like shape
                    ishiger = 1;
                    return;
                end
            end
        end
    end
end % end for
end
