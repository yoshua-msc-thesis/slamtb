function drawEucLmk(MapFig, Lmk, color)

% DRAWEUCLMK  Draw Euclidean point landmark in MapFig.

global Map

posOffset = [0;0;.2];
ran=Lmk.state.r;



% the ellipse
[X,Y,Z] = cov3elli(Map.x(ran), Map.P(ran,ran), 3, 10) ;
set(MapFig.estLmk(Lmk.lmk).ellipse,...
    'xdata',   X,...
    'ydata',   Y,...
    'zdata',   Z,...
    'color',   color,...
    'visible', 'on');

% the measurement:
y = Map.x(ran);
set(MapFig.estLmk(Lmk.lmk).mean,...
    'xdata',   y(1),...
    'ydata',   y(2),...
    'zdata',   y(3),...
    'color',   satColor(color),...
    'visible', 'on');

% the label
pos = Map.x(ran) + posOffset;
set(MapFig.estLmk(Lmk.lmk).label,...
    'position', pos,...
    'string',   num2str(Lmk.id),...
    'visible',  'on');
