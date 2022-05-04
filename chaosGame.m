function chaosGame(pocetIteraci, pocetVrcholu, pomer, stred)
format long

vrcholy = zeros(2,pocetVrcholu);

for i = 1:pocetVrcholu
    
    vrcholy(1,i) = cos( (i-1) * 2 * pi/pocetVrcholu + pi/2);
    vrcholy(2,i) = sin( (i-1) * 2 * pi/pocetVrcholu + pi/2);
end

if(stred)
    vrcholy(:,pocetVrcholu+1) = [0 0]';
    pocetVrcholu = pocetVrcholu + 1;
end


plot(vrcholy(1,:), vrcholy(2,:), 'or')
hold on

body = zeros(2,pocetIteraci);
body(1,1) = rand*2-1;
body(2,1) = rand*2-1;

for i = 2:pocetIteraci
    nahodnyVrchol = randi(pocetVrcholu);
    body(1,i) = body(1,i-1) + (vrcholy(1,nahodnyVrchol) - body(1,i-1))*pomer;
    body(2,i) = body(2,i-1) + (vrcholy(2,nahodnyVrchol) - body(2,i-1))*pomer;
end

plot(body(1,:),body(2,:),'.b');
end