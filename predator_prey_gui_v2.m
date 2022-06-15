function predator_prey_gui_v2

% Figure for program
fig = figure('numbertitle','off','name','Predator-Prey Dynamics',...
    'menubar','none','resize','on','position', [50 30 1050 700]);

% Creation of subplots

% ODEs vs Time
axes('units','pixels','Position',[50 500 500 175],'tag','axes1');
% Phase portrait of x and y
axes('units','pixels','Position',[60 325 200 125],'tag','axes2');
% Phase portrait of x, y, and s
axes('units','pixels','Position',[350 325 200 125],'tag','axes3');
% ODE image
axes('units','pixels','Position',[600 360 418 322],'tag','axes4');

% Creation of editable text boxes

% Initial conditions
uicontrol('style','edit','string','0.19','position',[360 220 75 25],...
    'tag','u');
uicontrol('style','edit','string','0.18','position',[360 180 75 25],...
    'tag','v');
uicontrol('style','edit','string','0.02','position',[360 140 75 25],...
    'tag','s');
uicontrol('style','edit','string','0.22','position',[360 100 75 25],...
    'tag','x');
uicontrol('style','edit','string','0.02','position',[360 60 75 25],...
    'tag','y');

% Variables
uicontrol('style','edit','string','1.6','position',[760 220 75 25],...
    'tag','c');
uicontrol('style','edit','string','1.6','position',[760 180 75 25],...
    'tag','k');
uicontrol('style','edit','string','1.0','position',[760 140 75 25],...
    'tag','rho');
uicontrol('style','edit','string','0.1','position',[760 100 75 25],...
    'tag','r');
uicontrol('style','edit','string','0.1','position',[760 60 75 25],...
    'tag','beta');
uicontrol('style','edit','string','0.1','position',[760 20 75 25],...
    'tag','mu');

% Time vector
uicontrol('style','edit','string','linspace(0,500,5001)','position',[900 220 130 25],...
    'horizontalalignment','left','tag','t');

% Creation of text labels

% Inital conditions text labels
uicontrol('style','text','string','Initial Conditions:','position',[10 250 200 30],...
    'fontsize',16,'horizontalalignment','left');
uicontrol('style','text','string','Population of Seals (Prey):  u(0) =','position',[10 220 340 25],...
    'fontsize',12,'foregroundcolor',[0 0 1],'horizontalalignment','right');
uicontrol('style','text','string','Population of Polar Bears (Predator):  v(0) =','position',[10 180 340 25],...
    'fontsize',12,'foregroundcolor',[0 0 1],'horizontalalignment','right');
uicontrol('style','text','string','Population of Lemmings (Resource):  s(0) =','position',[10 140 340 25],...
    'fontsize',12,'foregroundcolor',[0 0 1],'horizontalalignment','right');
uicontrol('style','text','string','Population of Foxes (Scavenger):  x(0) =','position',[10 100 340 25],...
    'fontsize',12,'foregroundcolor',[0 0 1],'horizontalalignment','right');
uicontrol('style','text','string','Seal Carrion (Quarry) Available for Foxes:  y(0) =','position',[10 60 340 25],...
    'fontsize',12,'foregroundcolor',[0 0 1],'horizontalalignment','right');

% Variables text labels
uicontrol('style','text','string','Variables:','position',[500 250 200 30],... 
    'fontsize',16,'horizontalalignment','left');
uicontrol('style','text','string','Carrying Capacity of Prey:  c =','position',[500 220 250 25],...
    'fontsize',12,'foregroundcolor',[0 0 1],'horizontalalignment','right');
uicontrol('style','text','string','Carrying Capacity of Resource:  k =','position',[500 180 250 25],...
    'fontsize',12,'foregroundcolor',[0 0 1],'horizontalalignment','right');
uicontrol('style','text','string', 'Growth Rate of Prey:  rho =','position',[500 140 250 25],...
    'fontsize',12,'foregroundcolor',[0 0 1],'horizontalalignment','right');
uicontrol('style','text','string', 'Growth Rate of Resource:  r =','position',[500 100 250 25],...
    'fontsize',12,'foregroundcolor',[0 0 1],'horizontalalignment','right');
uicontrol('style','text','string', 'Mortality Rate of Predator:  beta =','position',[500 60 250 25],...
    'fontsize',12,'foregroundcolor',[0 0 1],'horizontalalignment','right');
uicontrol('style','text','string', 'Conversion Factor:  mu =','position',[500 20 250 25],...
    'fontsize',12,'foregroundcolor',[0 0 1],'horizontalalignment','right');

% Time vector text labels
uicontrol('style','text','string','Time Vector:','position',[870 250 200 30],...
    'fontsize',16,'horizontalalignment','left');
uicontrol('style','text','string','t =','position',[845 220 50 25],... 
    'fontsize',12,'foregroundcolor',[0 0 1],'horizontalalignment','right');

% Run button
uicontrol('style','pushbutton','string' ,'RUN','position',[900 120 100 30],...
    'tag','run');

% Callback
handles = guihandles(fig);
guidata(fig,handles);
hca = struct2cell(handles);
for w = 1:length(hca)
    obj = hca{w};
    if isfield(obj,'callback') | isprop(obj,'callback')
        set(obj,'callback',{@main_cb,handles});
    end
end

axes(handles.axes4)
ODEimage =  imread('ODEs.jpg');
image(ODEimage)
axis off
axis image

% Perform operations
function main_cb(uiobject, eventdata, handles)
tag = get(uiobject,'tag'); % get control object's tag
switch tag
    case 'run'
        % default values
        phi = 5; psi = 5; theta = 5; h = 1; gam = 1; g = 1; beta = 0.1;
        zeta = 0.1; epsi = 0.1; eta = 0.1; delta = 0.1;
        % update params, ic and time vector based on user input
        c = eval(get(handles.c, 'String'));
        k = eval(get(handles.k, 'String'));
        rho = eval(get(handles.rho, 'String'));
        r = eval(get(handles.r, 'String'));
        beta = eval(get(handles.beta, 'String'));
        mu = eval(get(handles.mu, 'String'));
        uvsxy0 = [eval(get(handles.u, 'String')), eval(get(handles.v, 'String')), ...
            eval(get(handles.x, 'String')), eval(get(handles.y, 'String')), ...
            eval(get(handles.s, 'String'))]';
        tvec = eval(get(handles.t, 'String'));
        % define ODEs
        predatorprey = @(t,ic) [ ... 
            rho*ic(1)*(1-ic(1)/c) - phi*((ic(1)*ic(2))/(ic(1)+g))
            zeta*phi*ic(1)/(ic(1)+g)*ic(2) - beta*ic(2)
            mu*phi*ic(1)*ic(2)/(ic(1)+g) - gam*ic(3) - psi*ic(3)*ic(5)/(ic(4)+ic(3)+h)
            r*ic(4)*(1-ic(4)/k) - theta*ic(4)*ic(5)/(ic(4)+ic(3)+h)
            (epsi*theta*ic(4)+eta*psi*ic(3))/(ic(4)+ic(3)+h)*ic(5) - delta*ic(5)];
        % solve
        [t uvsxy] = ode45(predatorprey,tvec,uvsxy0);
        % plot
        axes(handles.axes1);
        plot(t, uvsxy)
        axis([0 max(tvec(:)) 0 max(uvsxy(:))]); xlabel('t'); legend('u','v','s','x', 'y')
        axes(handles.axes2);
        plot(uvsxy(:,4),uvsxy(:,5))
        % plot(uvsxy(500:end,4),uvsxy(500:end,5))
        axis tight; xlabel('x'); ylabel('y');
        axes(handles.axes3);
        plot3(uvsxy(500:end,3),uvsxy(500:end,4),uvsxy(500:end,5))  
        % plot3(uvsxy(:,3),uvsxy(:,4),uvsxy(:,5))
        axis tight;
        % axis([0 0.045 0 0.65 0 0.065])
        xlabel('s'); ylabel('x'); zlabel('y');
end