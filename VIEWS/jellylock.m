

#import "jellylock.h"



@implementation JellylockView

float origPos = 10;
int currentlySelected = 0;



- (instancetype)initWithFrame:(CGRect)frame
{
self = [super initWithFrame:frame];

self.app1 = [[NSString alloc] init];
self.app2 = [[NSString alloc] init];
self.app3 = [[NSString alloc] init];
self.app4 = [[NSString alloc] init];
self.app5 = [[NSString alloc] init];

if (self) {
[self setupViews];
}
return self;
}


-(void)setupViews{







UIColor *draggercolour = [self colorWithHexString:draggerColor alpha:1];
UIColor *circlecolour = [self colorWithHexString:circlecolor alpha:1];


self.blurView = [[UIView alloc] init];
self.blurView.translatesAutoresizingMaskIntoConstraints = NO;

self.blurView.backgroundColor = [UIColor clearColor];





if(blurEnabled){

self.blurView =  [objc_getClass("MTMaterialView") materialViewWithRecipe:6 configuration:1 initialWeighting:1];
}

self.blurView.frame = CGRectMake(0,-200,[[UIScreen mainScreen] bounds].size.width,500);
[self.blurView setUserInteractionEnabled:NO];
CAGradientLayer *l = [CAGradientLayer layer];
l.frame = self.blurView.bounds;

if(blurEnabled){
l.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0] CGColor],(id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8] CGColor],(id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:1] CGColor],(id)[[UIColor colorWithRed:0 green:0 blue:0 alpha:1] CGColor], nil];

l.startPoint = CGPointMake(0.5, 0.0);
l.endPoint = CGPointMake(0.5, 1.0);



self.blurView.layer.mask = l; 
}


self.blurView.hidden = YES;
[self insertSubview:self.blurView atIndex:0];

[NSLayoutConstraint activateConstraints:@[
[self.blurView.bottomAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor constant:100],
[self.blurView.centerXAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerXAnchor],
[self.blurView.widthAnchor constraintEqualToConstant:[[UIScreen mainScreen] bounds].size.width],
[self.blurView.heightAnchor constraintEqualToConstant:300],
]];



self.jellycontainer = [[UIView alloc] init];
self.jellycontainer.backgroundColor = [UIColor clearColor];


self.jellycontainer.translatesAutoresizingMaskIntoConstraints = NO;


self.jellycontainer.hidden = YES;




[self addSubview:self.jellycontainer];


[NSLayoutConstraint activateConstraints:@[
[self.jellycontainer.bottomAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor constant:35],
[self.jellycontainer.centerXAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerXAnchor],
[self.jellycontainer.widthAnchor constraintEqualToConstant:[[UIScreen mainScreen] bounds].size.width],
[self.jellycontainer.heightAnchor constraintEqualToConstant:280],
]];



self.jellyBackDrop = [[UIView alloc] init];
self.jellyBackDrop.backgroundColor = [UIColor clearColor];
self.jellyBackDrop.translatesAutoresizingMaskIntoConstraints = NO;
self.jellyBackDrop.layer.cornerRadius = 170;
self.jellyBackDrop.hidden = YES;




[self.jellycontainer insertSubview:self.jellyBackDrop atIndex:0];


[NSLayoutConstraint activateConstraints:@[
[self.jellyBackDrop.bottomAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor constant:120],
[self.jellyBackDrop.centerXAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerXAnchor],
[self.jellyBackDrop.widthAnchor constraintEqualToConstant:300],
[self.jellyBackDrop.heightAnchor constraintEqualToConstant:350],
]];





self.bigCircle = [[UIView alloc] init];


self.bigCircle.translatesAutoresizingMaskIntoConstraints = NO;
self.bigCircle.layer.cornerRadius = 160;

self.bigCircle.layer.borderColor = circlecolour.CGColor;
self.bigCircle.layer.borderWidth = 1.0f; //make border 1px thick
self.bigCircle.layer.shadowColor = circlecolour.CGColor;
self.bigCircle.layer.shadowOffset = CGSizeZero;
self.bigCircle.layer.shadowRadius = 1.0;
self.bigCircle.layer.shadowOpacity = 1.0;
self.bigCircle.hidden = YES;





[self.blurView insertSubview:self.bigCircle atIndex:0];


[NSLayoutConstraint activateConstraints:@[
[self.bigCircle.bottomAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor constant:120],
[self.bigCircle.centerXAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerXAnchor],
[self.bigCircle.widthAnchor constraintEqualToConstant:305],
[self.bigCircle.heightAnchor constraintEqualToConstant:305],
]];



self.returnJelly = [[UIView alloc] init];
self.returnJelly.backgroundColor = [UIColor clearColor];
self.returnJelly.translatesAutoresizingMaskIntoConstraints = NO;
self.returnJelly.layer.cornerRadius = 150;






[self.jellyBackDrop insertSubview:self.returnJelly atIndex:2];


[NSLayoutConstraint activateConstraints:@[
[self.returnJelly.bottomAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.bottomAnchor constant:100],
[self.returnJelly.centerXAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerXAnchor],
[self.returnJelly.widthAnchor constraintEqualToConstant:300],
[self.returnJelly.heightAnchor constraintEqualToConstant:300],
]];



self.jellyApp1 = [[UIView alloc] init];
self.jellyApp1.backgroundColor = [UIColor clearColor];
self.jellyApp1.layer.cornerRadius = 0;
self.jellyApp1.translatesAutoresizingMaskIntoConstraints = NO;


self.jellyApp1.layer.masksToBounds = YES;

[self.jellyBackDrop insertSubview:self.jellyApp1 atIndex:2];

[NSLayoutConstraint activateConstraints:@[
[self.jellyApp1.bottomAnchor constraintEqualToAnchor:self.jellyBackDrop.topAnchor constant:70],
[self.jellyApp1.centerXAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerXAnchor],
[self.jellyApp1.widthAnchor constraintEqualToConstant:52],
[self.jellyApp1.heightAnchor constraintEqualToConstant:52],
]];

self.jellyApp4 = [[UIView alloc] init];
self.jellyApp4.backgroundColor = [UIColor clearColor];
self.jellyApp4.layer.cornerRadius = 0;
self.jellyApp4.translatesAutoresizingMaskIntoConstraints = NO;


self.jellyApp4.layer.masksToBounds = YES;

[self.jellyBackDrop insertSubview:self.jellyApp4 atIndex:2];

[NSLayoutConstraint activateConstraints:@[
[self.jellyApp4.bottomAnchor constraintEqualToAnchor:self.jellyBackDrop.topAnchor constant:155],
[self.jellyApp4.centerXAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerXAnchor constant:135],
[self.jellyApp4.widthAnchor constraintEqualToConstant:52],
[self.jellyApp4.heightAnchor constraintEqualToConstant:52],
]];



self.jellyApp2 = [[UIView alloc] init];
self.jellyApp2.backgroundColor = [UIColor clearColor];
self.jellyApp2.layer.cornerRadius = 0;
self.jellyApp2.translatesAutoresizingMaskIntoConstraints = NO;


self.jellyApp2.layer.masksToBounds = YES;

[self.jellyBackDrop insertSubview:self.jellyApp2 atIndex:2];

[NSLayoutConstraint activateConstraints:@[
[self.jellyApp2.bottomAnchor constraintEqualToAnchor:self.jellyBackDrop.topAnchor constant:95],
[self.jellyApp2.centerXAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerXAnchor constant:80],
[self.jellyApp2.widthAnchor constraintEqualToConstant:52],
[self.jellyApp2.heightAnchor constraintEqualToConstant:52],
]];


self.jellyApp3 = [[UIView alloc] init];
self.jellyApp3.backgroundColor = [UIColor clearColor];
self.jellyApp3.layer.cornerRadius = 0;
self.jellyApp3.translatesAutoresizingMaskIntoConstraints = NO;


self.jellyApp3.layer.masksToBounds = YES;

[self.jellyBackDrop insertSubview:self.jellyApp3 atIndex:2];

[NSLayoutConstraint activateConstraints:@[
[self.jellyApp3.bottomAnchor constraintEqualToAnchor:self.jellyBackDrop.topAnchor constant:95],
[self.jellyApp3.centerXAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerXAnchor constant:-80],
[self.jellyApp3.widthAnchor constraintEqualToConstant:52],
[self.jellyApp3.heightAnchor constraintEqualToConstant:52],
]];








self.jellyApp5 = [[UIView alloc] init];
self.jellyApp5.backgroundColor = [UIColor clearColor];
self.jellyApp5.layer.cornerRadius = 0;
self.jellyApp5.translatesAutoresizingMaskIntoConstraints = NO;


self.jellyApp5.layer.masksToBounds = YES;





[self.jellyBackDrop insertSubview:self.jellyApp5 atIndex:2];

[NSLayoutConstraint activateConstraints:@[
[self.jellyApp5.bottomAnchor constraintEqualToAnchor:self.jellyBackDrop.topAnchor constant:155],
[self.jellyApp5.centerXAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerXAnchor constant:-135],
[self.jellyApp5.widthAnchor constraintEqualToConstant:52],
[self.jellyApp5.heightAnchor constraintEqualToConstant:52],
]];






self.jellyApp6 = [[UIView alloc] init];
self.jellyApp6.backgroundColor = [UIColor clearColor];
self.jellyApp6 =  [objc_getClass("MTMaterialView") materialViewWithRecipe:1 configuration:1 initialWeighting:1];
self.jellyApp6.layer.cornerRadius = 26;

self.jellyApp6.translatesAutoresizingMaskIntoConstraints = NO;


self.jellyApp6.layer.masksToBounds = YES;


if(leftshortcut != 0){
[self.jellyBackDrop insertSubview:self.jellyApp6 atIndex:2];

[NSLayoutConstraint activateConstraints:@[
[self.jellyApp6.bottomAnchor constraintEqualToAnchor:self.jellyBackDrop.topAnchor constant:230],
[self.jellyApp6.centerXAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerXAnchor constant:-145],
[self.jellyApp6.widthAnchor constraintEqualToConstant:52],
[self.jellyApp6.heightAnchor constraintEqualToConstant:52],
]];
} 





self.jellyApp7 = [[UIView alloc] init];
self.jellyApp7.backgroundColor = [UIColor clearColor];
self.jellyApp7 =  [objc_getClass("MTMaterialView") materialViewWithRecipe:1 configuration:1 initialWeighting:1];
self.jellyApp7.layer.cornerRadius = 26;

self.jellyApp7.translatesAutoresizingMaskIntoConstraints = NO;


self.jellyApp7.layer.masksToBounds = YES;

[self.jellyBackDrop insertSubview:self.jellyApp7 atIndex:2];

[NSLayoutConstraint activateConstraints:@[
[self.jellyApp7.bottomAnchor constraintEqualToAnchor:self.jellyBackDrop.topAnchor constant:230],
[self.jellyApp7.centerXAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.centerXAnchor constant:145],
[self.jellyApp7.widthAnchor constraintEqualToConstant:52],
[self.jellyApp7.heightAnchor constraintEqualToConstant:52],
]];










self.Usercircle = [[UIView alloc] init];
self.Usercircle.backgroundColor = [UIColor clearColor];
self.Usercircle.translatesAutoresizingMaskIntoConstraints = NO;

self.Usercircle.layer.cornerRadius = circleSize / 2;


self.Usercircle.layer.borderColor = draggercolour.CGColor;
self.Usercircle.layer.borderWidth = 1.5f; //make border 1px thick
self.Usercircle.layer.shadowColor = draggercolour.CGColor;
self.Usercircle.layer.shadowOffset = CGSizeZero;
self.Usercircle.layer.shadowRadius = 1.0;
self.Usercircle.layer.shadowOpacity = 1.0;


///  self.Usercircle.layer.contents = (__bridge id) [[UIImage imageNamed:@"Finger"] CGImage];

self.MoveCircleGesture = [[UIPanGestureRecognizer alloc] initWithTarget: self  action:@selector(movedCircle:)];
[self.Usercircle addGestureRecognizer:_MoveCircleGesture];



[self addSubview:self.Usercircle];



[NSLayoutConstraint activateConstraints:@[
[self.Usercircle.bottomAnchor constraintEqualToAnchor:self.jellycontainer.bottomAnchor constant:-50],
[self.Usercircle.centerXAnchor constraintEqualToAnchor:self.jellycontainer.centerXAnchor],
[self.Usercircle.widthAnchor constraintEqualToConstant:circleSize],
[self.Usercircle.heightAnchor constraintEqualToConstant:circleSize],
]];












}


- (void) movedCircle:(UIPanGestureRecognizer*) recognizer
{
UIColor *draggercolour = [self colorWithHexString:draggerColor alpha:1];

if(self.jellycontainer.hidden == YES){
CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)hideCSQuickactionsFromJelly, nil, nil, true);
}

self.jellycontainer.hidden = NO;
self.blurView.hidden = NO;
UIButton *Circle = (UIButton *)recognizer.view;
CGPoint translation = [recognizer translationInView:self.jellycontainer];

float xPosition = Circle.center.x;
float yPosition = Circle.center.y;
float buttonCenter = Circle.frame.size.height/2;


if (xPosition < buttonCenter)
xPosition = buttonCenter;
else if (xPosition > self.jellycontainer.frame.size.width - buttonCenter)
xPosition = self.jellycontainer.frame.size.width - buttonCenter;

if (yPosition < buttonCenter)
yPosition = buttonCenter;
else if (yPosition > self.jellycontainer.frame.size.height - buttonCenter)
yPosition = self.jellycontainer.frame.size.height - buttonCenter;

Circle.center = CGPointMake(xPosition + translation.x, yPosition + translation.y);
[recognizer setTranslation:CGPointZero inView:self.jellycontainer];

if(recognizer.state == UIGestureRecognizerStateBegan){

self.jellyBackDrop.hidden = NO;
self.bigCircle.hidden = NO;

origPos = Circle.center.y;



}

if(recognizer.state == UIGestureRecognizerStateChanged){








if(CGRectContainsPoint(Circle.frame,self.returnJelly.center)){
Circle.hidden = NO;
currentlySelected = 0;

self.jellyApp1.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;

self.jellyApp1.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp2.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp2.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp3.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp3.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp4.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp4.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp5.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp5.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp6.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp6.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp7.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp7.layer.shadowColor = [UIColor clearColor].CGColor;
}


if (CGRectContainsPoint(Circle.frame,self.jellyApp1.center))
{

self.jellyApp2.layer.cornerRadius = 0;
self.jellyApp3.layer.cornerRadius = 0;
self.jellyApp4.layer.cornerRadius = 0;
self.jellyApp5.layer.cornerRadius = 0;
self.jellyApp6.layer.cornerRadius = 26;
if(currentlySelected != 1){

currentlySelected = 1;
self.jellyApp1.layer.cornerRadius = 26;
AudioServicesPlaySystemSound(1520);
}
Circle.hidden = YES;

self.jellyApp2.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp2.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp3.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp3.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp4.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp4.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp5.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp5.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp6.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp6.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp7.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp7.layer.shadowColor = [UIColor clearColor].CGColor;

self.jellyApp1.layer.borderColor = draggercolour.CGColor;
self.jellyApp1.layer.borderWidth = 2.5f; //make border 1px thick
self.jellyApp1.layer.shadowColor = draggercolour.CGColor;
self.jellyApp1.layer.shadowOffset = CGSizeZero;
self.jellyApp1.layer.shadowRadius = 10.0;
self.jellyApp1.layer.shadowOpacity = 1.0;

}

if (CGRectContainsPoint(Circle.frame,self.jellyApp2.center))
{

self.jellyApp1.layer.cornerRadius = 0;

self.jellyApp3.layer.cornerRadius = 0;
self.jellyApp4.layer.cornerRadius = 0;
self.jellyApp5.layer.cornerRadius = 0;
self.jellyApp6.layer.cornerRadius = 26;

if(currentlySelected != 2){

currentlySelected = 2;
self.jellyApp2.layer.cornerRadius = 26;
AudioServicesPlaySystemSound(1520);

}

Circle.hidden = YES;
self.jellyApp1.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp1.layer.shadowColor = [UIColor clearColor].CGColor;

self.jellyApp3.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp3.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp4.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp4.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp5.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp5.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp6.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp6.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp7.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp7.layer.shadowColor = [UIColor clearColor].CGColor;

self.jellyApp2.layer.borderColor = draggercolour.CGColor;
self.jellyApp2.layer.borderWidth = 2.5f; //make border 1px thick
self.jellyApp2.layer.shadowColor = draggercolour.CGColor;
self.jellyApp2.layer.shadowOffset = CGSizeZero;
self.jellyApp2.layer.shadowRadius = 10.0;
self.jellyApp2.layer.shadowOpacity = 1.0;

}




if (CGRectContainsPoint(Circle.frame,self.jellyApp3.center))
{
self.jellyApp1.layer.cornerRadius = 0;
self.jellyApp2.layer.cornerRadius = 0;

self.jellyApp4.layer.cornerRadius = 0;
self.jellyApp5.layer.cornerRadius = 0;
self.jellyApp6.layer.cornerRadius = 26;

if(currentlySelected != 3){

currentlySelected = 3;
self.jellyApp3.layer.cornerRadius = 26;
AudioServicesPlaySystemSound(1520);

}
Circle.hidden = YES;

self.jellyApp1.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp1.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp2.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp2.layer.shadowColor = [UIColor clearColor].CGColor;

self.jellyApp4.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp4.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp5.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp5.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp6.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp6.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp7.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp7.layer.shadowColor = [UIColor clearColor].CGColor;


self.jellyApp3.layer.borderColor = draggercolour.CGColor;
self.jellyApp3.layer.borderWidth = 2.5f; //make border 1px thick
self.jellyApp3.layer.shadowColor = draggercolour.CGColor;
self.jellyApp3.layer.shadowOffset = CGSizeZero;
self.jellyApp3.layer.shadowRadius = 100.0;
self.jellyApp3.layer.shadowOpacity = 1.0;


}






if (CGRectContainsPoint(Circle.frame,self.jellyApp4.center))
{

self.jellyApp1.layer.cornerRadius = 0;
self.jellyApp2.layer.cornerRadius = 0;
self.jellyApp3.layer.cornerRadius = 0;

self.jellyApp5.layer.cornerRadius = 0;
self.jellyApp6.layer.cornerRadius = 25;
if(currentlySelected != 4){

currentlySelected = 4;
self.jellyApp4.layer.cornerRadius = 26;
AudioServicesPlaySystemSound(1520);

}


self.jellyApp1.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp1.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp2.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp2.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp3.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp3.layer.shadowColor = [UIColor clearColor].CGColor;

self.jellyApp5.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp5.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp7.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp7.layer.shadowColor = [UIColor clearColor].CGColor;

self.jellyApp6.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp6.layer.shadowColor = [UIColor clearColor].CGColor;
Circle.hidden = YES;
self.jellyApp4.layer.borderColor = draggercolour.CGColor;
self.jellyApp4.layer.borderWidth = 2.5f; //make border 1px thick
self.jellyApp4.layer.shadowColor = draggercolour.CGColor;
self.jellyApp4.layer.shadowOffset = CGSizeZero;
self.jellyApp4.layer.shadowRadius = 100.0;
self.jellyApp4.layer.shadowOpacity = 1.0;


}




if (CGRectContainsPoint(Circle.frame,self.jellyApp5.center))
{

self.jellyApp1.layer.cornerRadius = 0;
self.jellyApp2.layer.cornerRadius = 0;
self.jellyApp3.layer.cornerRadius = 0;
self.jellyApp4.layer.cornerRadius = 0;
self.jellyApp6.layer.cornerRadius = 26;

if(currentlySelected != 5){

currentlySelected = 5;
self.jellyApp5.layer.cornerRadius = 26;
AudioServicesPlaySystemSound(1520);

}

self.jellyApp1.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp1.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp2.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp2.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp3.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp3.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp4.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp4.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp6.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp6.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp7.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp7.layer.shadowColor = [UIColor clearColor].CGColor;



Circle.hidden = YES;
self.jellyApp5.layer.borderColor = draggercolour.CGColor;
self.jellyApp5.layer.borderWidth = 2.5f; //make border 1px thick
self.jellyApp5.layer.shadowColor = draggercolour.CGColor;
self.jellyApp5.layer.shadowOffset = CGSizeZero;
self.jellyApp5.layer.shadowRadius = 100.0;
self.jellyApp5.layer.shadowOpacity = 1.0;





}




if (CGRectContainsPoint(Circle.frame,self.jellyApp6.center))
{

self.jellyApp1.layer.cornerRadius = 0;
self.jellyApp2.layer.cornerRadius = 0;
self.jellyApp3.layer.cornerRadius = 0;
self.jellyApp4.layer.cornerRadius = 0;
self.jellyApp5.layer.cornerRadius = 0;

if(currentlySelected != 6){

currentlySelected = 6;
self.jellyApp6.layer.cornerRadius = 26;
AudioServicesPlaySystemSound(1520);

}

self.jellyApp1.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp1.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp2.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp2.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp3.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp3.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp4.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp4.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp5.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp5.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp7.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp7.layer.shadowColor = [UIColor clearColor].CGColor;


Circle.hidden = YES;  



self.jellyApp6.layer.borderColor = draggercolour.CGColor;
self.jellyApp6.layer.borderWidth = 2.5f; //make border 1px thick
self.jellyApp6.layer.shadowColor = draggercolour.CGColor;
self.jellyApp6.layer.shadowOffset = CGSizeZero;
self.jellyApp6.layer.shadowRadius = 100.0;
self.jellyApp6.layer.shadowOpacity = 1.0;



}

if (CGRectContainsPoint(Circle.frame,self.jellyApp7.center))
{

self.jellyApp1.layer.cornerRadius = 0;
self.jellyApp2.layer.cornerRadius = 0;
self.jellyApp3.layer.cornerRadius = 0;
self.jellyApp4.layer.cornerRadius = 0;
self.jellyApp5.layer.cornerRadius = 0;

if(currentlySelected != 7){

currentlySelected = 7;
self.jellyApp7.layer.cornerRadius = 26;
AudioServicesPlaySystemSound(1520);

}

self.jellyApp1.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp1.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp2.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp2.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp3.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp3.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp4.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp4.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp5.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp5.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp6.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp6.layer.shadowColor = [UIColor clearColor].CGColor;


Circle.hidden = YES;



self.jellyApp7.layer.borderColor = draggercolour.CGColor;
self.jellyApp7.layer.borderWidth = 2.5f; //make border 1px thick
self.jellyApp7.layer.shadowColor = draggercolour.CGColor;
self.jellyApp7.layer.shadowOffset = CGSizeZero;
self.jellyApp7.layer.shadowRadius = 100.0;
self.jellyApp7.layer.shadowOpacity = 1.0;


}





}



if(recognizer.state == UIGestureRecognizerStateEnded){
self.jellycontainer.hidden = YES;
self.blurView.hidden = YES;
self.jellyApp1.layer.cornerRadius = 0;
self.jellyApp2.layer.cornerRadius = 0;
self.jellyApp3.layer.cornerRadius = 0;
self.jellyApp4.layer.cornerRadius = 0;
self.jellyApp5.layer.cornerRadius = 0;
self.jellyApp6.layer.cornerRadius = 26;




CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)showCSQuickactionsFromJelly, nil, nil, true);
if (currentlySelected == 1){

[[UIApplication sharedApplication] launchApplicationWithIdentifier:self.app1 suspended:FALSE];
CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)OpenAppFromJelly, nil, nil, true);
openAppBundleid = self.app1;

}
if (currentlySelected == 2){
[[UIApplication sharedApplication] launchApplicationWithIdentifier:self.app2 suspended:FALSE];
CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)OpenAppFromJelly, nil, nil, true);
openAppBundleid = self.app2;
}
if (currentlySelected == 3){
[[UIApplication sharedApplication] launchApplicationWithIdentifier:self.app3 suspended:FALSE];
CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)OpenAppFromJelly, nil, nil, true);
openAppBundleid = self.app3;
}
if (currentlySelected == 4){
[[UIApplication sharedApplication] launchApplicationWithIdentifier:self.app4 suspended:FALSE];
CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)OpenAppFromJelly, nil, nil, true);
openAppBundleid = self.app4;
}
if (currentlySelected == 5){
[[UIApplication sharedApplication] launchApplicationWithIdentifier:self.app5 suspended:FALSE];
CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)OpenAppFromJelly, nil, nil, true);
openAppBundleid = self.app5;
}
if (currentlySelected == 6){


switch ((int)leftshortcut){

case 1 : 
if([[objc_getClass("SBUIFlashlightController") sharedInstance] level] == 0){
[[objc_getClass("SBUIFlashlightController") sharedInstance] setLevel:4];
}else{
[[objc_getClass("SBUIFlashlightController") sharedInstance] setLevel:0];
}
break;

case 2 : 
[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.camera" suspended:FALSE];
CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)OpenAppFromJelly, nil, nil, true);
openAppBundleid = @"com.apple.camera";
break;

case 3 : 
CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)OpenAppFromJelly, nil, nil, true);
break;

case 4 : 
MRMediaRemoteSendCommand(kMRTogglePlayPause, nil);

break;

case 5 : 
CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)StartSentinel, nil, nil, true);
break;   




}













}

if (currentlySelected == 7){

switch ((int)rightshortcut){

case 1 : 
if([[objc_getClass("SBUIFlashlightController") sharedInstance] level] == 0){
[[objc_getClass("SBUIFlashlightController") sharedInstance] setLevel:4];
}else{
[[objc_getClass("SBUIFlashlightController") sharedInstance] setLevel:0];
}
break;

case 2 : 
[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.apple.camera" suspended:FALSE];
CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)OpenAppFromJelly, nil, nil, true);
openAppBundleid = @"com.apple.camera";
break;

case 3 : 
CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)OpenAppFromJelly, nil, nil, true);
break;

case 4 : 
MRMediaRemoteSendCommand(kMRTogglePlayPause, nil);

break;

case 5 : 
CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)StartSentinel, nil, nil, true);
break;   




}

}






self.jellyBackDrop.hidden = YES;
self.bigCircle.hidden = YES;
currentlySelected = 0;
Circle.hidden = NO;
self.jellyApp1.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp1.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp2.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp2.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp3.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp3.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp4.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp4.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp5.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp5.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp6.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp6.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp7.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp7.layer.shadowColor = [UIColor clearColor].CGColor;



[UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseOut     animations:^{
self.Usercircle.center = CGPointMake(self.frame.size.width / 2,
self.jellycontainer.frame.size.height / 1.5);
} completion:nil];



}

}

-(void)resetJelly{
UIColor *draggercolour = [self colorWithHexString:draggerColor alpha:1];
CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)showCSQuickactionsFromJelly, nil, nil, true);
self.jellycontainer.hidden = YES;
self.jellyBackDrop.hidden = YES;
self.blurView.hidden = YES;
self.bigCircle.hidden = YES;
currentlySelected = 0;
self.Usercircle.hidden = NO;
self.jellyApp1.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp1.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp2.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp2.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp3.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp3.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp4.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp4.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp5.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp5.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp6.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp6.layer.shadowColor = [UIColor clearColor].CGColor;
self.jellyApp7.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.0f].CGColor;
self.jellyApp7.layer.shadowColor = [UIColor clearColor].CGColor;





[UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseOut     animations:^{
self.Usercircle.center = CGPointMake(self.frame.size.width / 2,
self.jellycontainer.frame.size.height / 1.5);
} completion:nil];
}



-(void)loadIcons{
UIColor *draggercolour = [self colorWithHexString:draggerColor alpha:1];


self.Usercircle.layer.borderColor = draggercolour.CGColor;
self.Usercircle.layer.borderWidth = 1.5f; //make border 1px thick
self.Usercircle.layer.shadowColor = draggercolour.CGColor;
self.Usercircle.layer.shadowOffset = CGSizeZero;
self.Usercircle.layer.shadowRadius = 1.0;
self.Usercircle.layer.shadowOpacity = 1.0;



self.jellyApp1.layer.contents = (__bridge id) [[UIImage _applicationIconImageForBundleIdentifier:self.app1
format:2 scale:3] CGImage];
self.jellyApp2.layer.contents = (__bridge id) [[UIImage _applicationIconImageForBundleIdentifier:self.app2
format:2 scale:3] CGImage];
self.jellyApp3.layer.contents = (__bridge id) [[UIImage _applicationIconImageForBundleIdentifier:self.app3
format:2 scale:3] CGImage];
self.jellyApp4.layer.contents = (__bridge id) [[UIImage _applicationIconImageForBundleIdentifier:self.app4
format:2 scale:3] CGImage];

self.jellyApp5.layer.contents = (__bridge id) [[UIImage _applicationIconImageForBundleIdentifier:self.app5
format:2 scale:3] CGImage];

if([self.app5 length] == 0){
[self.jellyApp5 removeFromSuperview];
}

if([self.app4 length] == 0){
[self.jellyApp4 removeFromSuperview];
}

if([self.app3 length] == 0){
[self.jellyApp3 removeFromSuperview];
}

if([self.app2 length] == 0){
[self.jellyApp2 removeFromSuperview];
}

if([self.app1 length] == 0){
[self.jellyApp1 removeFromSuperview];
}

switch ((int)leftshortcut){

case 1 : 
self.jellyApp6.layer.contents = (__bridge id) [[UIImage imageWithContentsOfFile:@"Library/Application Support/JellyLockReborn/flashlight.png"] CGImage];
break;
case 2 : 
self.jellyApp6.layer.contents = (__bridge id) [[UIImage imageWithContentsOfFile:@"Library/Application Support/JellyLockReborn/camera.png"] CGImage];
break;
case 3 : 
self.jellyApp6.layer.contents = (__bridge id) [[UIImage imageWithContentsOfFile:@"Library/Application Support/JellyLockReborn/JellyLockLock@2x.png"] CGImage];
break;
case 4 : 
self.jellyApp6.layer.contents = (__bridge id) [[UIImage imageWithContentsOfFile:@"Library/Application Support/JellyLockReborn/playpause.png"] CGImage];
break;
case 5 : 
self.jellyApp6.layer.contents = (__bridge id) [[UIImage imageWithContentsOfFile:@"Library/Application Support/JellyLockReborn/sentinel@2x.png"] CGImage];
break;   




}


switch ((int)rightshortcut){

case 1 : 
self.jellyApp7.layer.contents = (__bridge id) [[UIImage imageWithContentsOfFile:@"Library/Application Support/JellyLockReborn/flashlight.png"] CGImage];
break;
case 2 : 
self.jellyApp7.layer.contents = (__bridge id) [[UIImage imageWithContentsOfFile:@"Library/Application Support/JellyLockReborn/camera.png"] CGImage];
break;
case 3 : 
self.jellyApp7.layer.contents = (__bridge id) [[UIImage imageWithContentsOfFile:@"Library/Application Support/JellyLockReborn/JellyLockLock@2x.png"] CGImage];
break;
case 4 : 
self.jellyApp7.layer.contents = (__bridge id) [[UIImage imageWithContentsOfFile:@"Library/Application Support/JellyLockReborn/playpause.png"] CGImage];
break;
case 5 : 
self.jellyApp7.layer.contents = (__bridge id) [[UIImage imageWithContentsOfFile:@"Library/Application Support/JellyLockReborn/sentinel@2x.png"] CGImage];
break;   




}





}


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
for (UIView *view in self.subviews) {
if (!view.hidden && [view pointInside:[self convertPoint:point toView:view] withEvent:event]) {
return YES;
}
}
return NO;
}



- (UIColor *)colorWithHexString:(NSString *)str_HEX  alpha:(CGFloat)alpha_range{
int red = 0;
int green = 0;
int blue = 0;
sscanf([str_HEX UTF8String], "#%02X%02X%02X", &red, &green, &blue);
return  [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha_range];
}

@end
