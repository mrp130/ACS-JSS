function selected = selection_roullette(probability)
    c = cumsum(probability);
    r = rand();
    selected = find(c >= r);
    selected = selected(1);
end