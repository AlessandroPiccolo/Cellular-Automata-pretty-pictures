% Checks surrounding elements if there is one element that is
% one higher than the element with index i, j. If at maxState
% element then check if surrounding elements is a zero.
% The range of the neighbourhood is defined by the range parameter.
function ishiger = turbulentHigherCheck(grid, i, j, maxState, range)
ishiger = 0; temp = 0;
for x = i-range:i+range
    for y = j-range:j+range
        % Normal state check
        if (grid(i,j) ~= maxState)
            if (grid(x,y) == grid(i,j)+1)
                temp = temp + 1;
            end
        % Special case at max state
        else
            if (grid(x,y) == 0); % creates sprial
                temp = temp + 1;
            end
        end
    end
end % end for
if (temp > 4)
    ishiger = 1;
end

end
