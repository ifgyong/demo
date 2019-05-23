//
//  ViewController.m
//  test
//
//  Created by Charlie on 2019/5/7.
//  Copyright © 2019 www.fgyong.cn. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "CashReport.h"
#import <Foundation/Foundation.h>
#import "CreateShape.h"
#import "Singleton.h"
#import "aof/Builder.h"
#import "aof/Copy_item.h"

#import "aof/MiddlePlayer.h"
#import "aof/BridgePatter.h"
#import "aof/Person_2.h"
#import "aof/Employee.h"
#import "aof/Shape_2.h"
#import "aof/Shape_4.h"
#import "aof/Shape_5.h"
#import "aof/DelegateImage.h"
#import "aof/Logger.h"
#import "aof/Order.h"
#import "aof/Pattern.h"
#import "aof/Iterator.h"
#import "aof/ChatRoom.h"
#import "aof/MementoObj.h"
#import "aof/SubjectOb.h"
#import "aof/FYState.h"
#import "aof/Strategy.h"
#import "aof/ComputerPartObj.h"
#import "aof/TemplatePattern.h"

@class NSPortMessage;
@interface ViewController ()<NSMachPortDelegate,ValueChangeProtocol>
{
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//  [CashReport share] ;
//    [self skeletonThreadMain];
//    [self test];
//    [self threadMain];
    [self test_ball];
}
- (void)test_ball{
    Game *foot=[Football new];
    [foot play];
    Game *pp=[PingPangBall new];
    [pp play];
}
- (void)test_visitor{
    ComputerPart *part=[Computer new];
    [part accept:[ComputerDisplayVisitor new]];
}
- (void)test_strategy{
    Context_1 *context =[Context_1 Context_1:[OperationMultiply alloc]];
    NSLog(@"2*4=%ld",(long)[context exce:2 and:4]);
    Context_1 * contexe2 =[Context_1 Context_1:[Opertation alloc]];
    NSLog(@"2+4=%ld",(long)[contexe2 exce:2 and:4]);
}
- (void)test_state{
    Context *context = [[Context alloc]init];
    StartState *start =[[StartState alloc]init];
    [start doAction:context];
    NSLog(@"%@",[[context state] performSelector:@selector(toString)]);
    StopState *stop =[[StopState alloc]init];
    [stop doAction:context];
    NSLog(@"%@",[[context state] performSelector:@selector(toString)]);
}
- (void)test_subject{
    SubjectOb *obj=[[SubjectOb alloc]init];
    [obj attach:self];
    obj.state  = 2;
    obj.state = 3;
}
- (void)didChange{
    NSLog(@"value change");
}

- (void)test_taker{
    Originator *ori=[Originator new];
    CareTaker *care =[CareTaker new];
    ori.stateStr = @"state #1";
    ori.stateStr = @"state #2";
    [care add:[ori saveMement]];
    ori.stateStr = @"state #3";
    [care add:[ori saveMement]];
    ori.stateStr = @"state #4";
    NSLog(@"current: %@",[ori stateStr]);
    [ori getMementState:[care get:0]];
    NSLog(@"first: %@",[ori stateStr]);
    [ori getMementState:[care get:1]];
    NSLog(@"second: %@",[ori stateStr]);

}
- (void)test_user{
    User *us=[User User:@"Robert"];
    User *john=[User User:@"John"];
    [us sendMessage:@"hi!John"];
    [john sendMessage:@"Hello!Robert"];

}
- (void)test_itertor{
    NameRepository *res=[[NameRepository alloc]init];
    for (NameIterator *itertor= [res getIterator]; [itertor hasNext]; ) {
        NSString *name = (NSString *)itertor.next;
        NSLog(@"name:%@",name);
    }
}
- (id<PatternProtocol> )getMaleTer{
    TerminalExpression *ter1=[TerminalExpression TerminalExpression:@"Rob"];
    TerminalExpression *ter2=[TerminalExpression TerminalExpression:@"John"];
    return [orTerminalExpression TerminalExpression:ter1 or:ter2];
}
- (id<PatternProtocol> )getMarriedWodn{
    TerminalExpression *ter1=[TerminalExpression TerminalExpression:@"Julie"];
    TerminalExpression *ter2=[TerminalExpression TerminalExpression:@"Married"];
    return [andTerminalExpression TerminalExpression:ter1 or:ter2];
}
- (void)test_pattern{
    id <PatternProtocol> ter =[self getMaleTer];
    id<PatternProtocol> ter2 =[self getMarriedWodn];
    NSLog(@"John is male? %d",[ter interpret:@"John"]);
    NSLog(@"Julie is a married women? ? %d",[ter2 interpret:@"Married Julie"]);

}
- (void)test_order{
    Stock *st=[[Stock alloc]init];
    BuyStock *buyst=[BuyStock BuyStock:st];
    SellStock *sell=[SellStock SellStock:st];
    Order *order=[[Order alloc]init];
    [order takeOrder:buyst];
    [order takeOrder:sell];
    [order placeOrder];
}
- (AbstractLogger *)getChainOfLoggers{
    AbstractLogger *log=[ErrorLogger ErrorLogger:LevelError];
    AbstractLogger *file=[FileLogger FileLogger:LevelDEBUG];
    AbstractLogger *console=[ConsoleLogger consoleLogger:LevelInfo];
    log.nextLogger = file;
    file.nextLogger = console;
    return log;
}
- (void)test_log{
    AbstractLogger *log=[self getChainOfLoggers];
    [log logMessage:LevelInfo msg:@"this is info"];
    [log logMessage:LevelDEBUG msg:@"thi is debug"];
    [log logMessage:LevelError msg:@"this is error"];
}
- (void)test_delegate{
    id<ImageProtocol> obj =[ProxyImage ProxyImage:@"test_01.jpg"];
    //第一次需要从个磁盘加载
    [obj display];
    NSLog(@" ");
    //不需要从磁盘加载
    [obj display];
}
- (void)test_shape5{
    NSArray *colors = @[@"white",@"Blue",@"black",@"Red"];
    Shape_5_Factory *f=[[Shape_5_Factory alloc]init];
    for (int i = 0; i < 20; i ++) {
        Circle_5 *c5=[f getShape:colors[arc4random()%4]];
        c5.x = arc4random()%100;
        c5.y = arc4random() %100;
        c5.radius = arc4random() % 100;
        [c5 draw];
    }
}
- (void)test_shape4{
    Shape_4_Maker *make=[Shape_4_Maker initWithCircle:[Cirle_4 new] rectang:[Rectangle_4 new]];
    [make drawCircle];
    [make drawRectang];
}
- (void)test_shape2{
    Circle_3 *s1 =[[Circle_3 alloc]init];
    ShapeDecorator *d1=[ShapeDecorator new];
    d1.obj = s1;
    ShapeDecorator *d2 =[Shape_3 new];
    d2.obj = [Rectangle_3 new];
    NSLog(@"Circle with normal border");
    [s1 draw];
    NSLog(@"Circle of red border");
    [d1 draw];
    NSLog(@"Rectangle of red border");
    [d2 draw];
}
- (void)test_employee{
    Employee *ceo=[[Employee alloc]initWithName:@"Kimi" dept:@"CEO" sal:99999];
    Employee *l1=[[Employee alloc]initWithName:@"Bob" dept:@"CTO" sal:8];
    Employee *l2=[[Employee alloc]initWithName:@"Job" dept:@"COO" sal:7];
    Employee *l3=[[Employee alloc]initWithName:@"Linder" dept:@"COO" sal:6];
    [ceo add:l1];
    [l1 add:l2];
    [l1 add:l3];
    NSLog(@"%@",ceo.description);
    for (Employee *item in ceo.subordinates) {
        NSLog(@"%@",item.description);
        for (Employee *item2 in item.subordinates) {
            NSLog(@"%@",item2.description);
        }
    }
    
}
- (void)test_person2{
    
    NSMutableArray *list1 =[NSMutableArray array];
    [list1 addObject:[[Person_2 alloc]initWithName:@"Join" gender:@"Male" maritalStatus:@"single"]];
    [list1 addObject:[[Person_2 alloc]initWithName:@"Bob" gender:@"Single" maritalStatus:@"single"]];
    [list1 addObject:[[Person_2 alloc]initWithName:@"Mike" gender:@"Single" maritalStatus:@"Male"]];
    
    CriteriaMale *male=[CriteriaMale new];
    CriteriaSingle *signle=[CriteriaSingle new];
    andCriteria *and=[andCriteria new];
    orCriteria *or=[orCriteria new];
    NSLog(@"Males:%@",[male meetCriteria:list1]);
    NSLog(@"Single:%@",[signle meetCriteria:list1]);
    and.criteria = male;
    and.otherCriteria = signle;
    NSLog(@"and:%@",[and meetCriteria:list1]);
    or.criteria = male;
    or.otherCriteria = signle;
    NSLog(@"or:%@",[or meetCriteria:list1]);


}
-(void)test_patter{
    Shape *p = [Circle_2 configWithRadius:100 x:10 y:10 draw:[RedCircle new]];
    [p draw];
    Shape *p1 = [Circle_2 configWithRadius:10 x:1 y:1 draw:[GreenCircle new]];
    [p1 draw];
    
}
- (void)test_middlePlayer{
    MediaAdapter *player=[MediaAdapter new];
    [player play:@"1" type:@"mp4"];
    [player play:@"2" type:@"vlc"];
}
- (void)test_copy{
    ShapeCache *cahce=[ShapeCache new];
    [cahce loadCache];
    ShapeCopy *sp1 =[cahce getShape:@"1"];
    NSLog(@"name:%@",sp1.name);
    ShapeCopy *sp2 =[cahce getShape:@"2"];
    NSLog(@"name:%@",sp2.name);
}
- (void)testBuilder{
//    MealBuild *mlb=[MealBuild new];
//    Meal *vemeal = [mlb prepareVeMeal];
//    NSLog(@"Veg Meal");
//    [vemeal showItems];
//    NSLog(@"totalCost:%f",vemeal .getCost);
//
//    Meal *ml =[mlb prepareNoneVeMeal];
//    NSLog(@"NoneVeMeal");
//    [ml showItems];
//    NSLog(@"totalCost:%f",ml.getCost);
}
- (void)testSingle{
    Singleton *t = [Singleton new];
    [t showMessage];
}
- (void)testShape{
    //获取Circle对象
 
    //shape获取工厂
    AbstractFactory * shape = [[FactoryProducer new] getFactory:NSStringFromClass(ShapeFactory.class)];
    Square *sq =[shape getShape:NSStringFromClass(Square.class)];
    [sq draw];
    Circle *ci = [shape getShape:NSStringFromClass(Circle.class)];
    //执行draw方法
    [ci draw];
    //获取color工厂
    AbstractFactory * colorF = [[FactoryProducer new] getFactory:NSStringFromClass(ColorFactory.class)];
    Red *red = [colorF getColor:NSStringFromClass(Red.class)];
    [red fill];
    Blue *blue = [colorF getColor:NSStringFromClass(Blue.class)];
    [blue fill];
    Green *green = [colorF getColor:NSStringFromClass(Green.class)];
    [green fill];
    
}
- (void)test{
    NSRunLoop* myRunLoop = [NSRunLoop currentRunLoop];
    
    // Create and schedule the first timer.
    NSDate* futureDate = [NSDate dateWithTimeIntervalSinceNow:1.0];
    NSTimer* myTimer = [[NSTimer alloc] initWithFireDate:futureDate
                                                interval:0.5
                                                  target:self
                                                selector:@selector(myDoFireTimer1:)
                                                userInfo:nil
                                                 repeats:YES];
    [myRunLoop addTimer:myTimer forMode:NSDefaultRunLoopMode];
    
    // Create and schedule the second timer.
    [NSTimer scheduledTimerWithTimeInterval:0.51
                                     target:self
                                   selector:@selector(myDoFireTimer2:)
                                   userInfo:nil
                                    repeats:YES];
}


static void myRunLoopObserver(CFRunLoopObserverRef observer,  CFRunLoopActivity activity, void *info){
    const char * ti = [NSDate dateWithTimeIntervalSinceNow:0].description.UTF8String;
    printf("\n%s",ti);
    switch (activity) {
        case kCFRunLoopEntry:
            printf(" 下一个loop 开始");
            break;
        case kCFRunLoopExit:
            printf(" loop 退出了");
            break;
        case kCFRunLoopAfterWaiting:
            printf(" kCFRunLoop  醒来了");
            break;
        case kCFRunLoopBeforeWaiting:
        {
            printf(" kCFRunLoop 干完活了");
        }
            break;
        case kCFRunLoopBeforeTimers:
            printf(" kCFRunLoopBeforeTimers");
            break;
        case kCFRunLoopBeforeSources:
            printf(" kCFRunLoopBeforeSources");
            break;
        default:
            break;
    }
}
- (void)threadMain
{

    // The application uses garbage collection, so no autorelease pool is needed.
    NSRunLoop* myRunLoop = [NSRunLoop currentRunLoop];
    
    // Create a run loop observer and attach it to the run loop.
    CFRunLoopObserverContext  context = {0, (__bridge void*)self, NULL, NULL, NULL};
    CFRunLoopObserverRef    observer = CFRunLoopObserverCreate(kCFAllocatorDefault,
                                                               kCFRunLoopAllActivities, YES, 0, &myRunLoopObserver, &context);
       
    
    if (observer)
    {
        CFRunLoopRef    cfLoop = [myRunLoop getCFRunLoop];
        CFRunLoopAddObserver(cfLoop, observer, kCFRunLoopDefaultMode);
    }
    
    // Create and schedule the timer.
    [NSTimer scheduledTimerWithTimeInterval:30
                                     target:self
                                   selector:@selector(myDoFireTimer1:)
                                   userInfo:nil
                                    repeats:YES];
    
    NSInteger    loopCount = 0;
    do
    {
        // Run the run loop 10 times to let the timer fire.
        NSDate * date = [NSDate dateWithTimeIntervalSinceNow:1];
        [myRunLoop runUntilDate:date];
        NSLog(@"do white ------%ld %@",(long)loopCount,date.description);
        loopCount--;
    }
    while (loopCount>0);
}

- (void)skeletonThreadMain
{
    // Set up an autorelease pool here if not using garbage collection.
    BOOL done = NO;
    
    // Add your sources or timers to the run loop and do any other setup.
    
    do
    {
        // Start the run loop but return after each source is handled.
        SInt32    result = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 10, YES);
        
        // If a source explicitly stopped the run loop, or if there are no
        // sources or timers, go ahead and exit.
        if ((result == kCFRunLoopRunStopped) || (result == kCFRunLoopRunFinished))
            done = YES;
        
        // Check for any other exit conditions here and set the
        // done variable as needed.
    }
    while (!done);
    
    // Clean up code here. Be sure to release any allocated autorelease pools.
}
- (void)myDoFireTimer1:(NSObject *)obj{
    printf("\n %s",__func__);
}
- (void)myDoFireTimer2:(NSObject *)obj{
    printf("\n %s",__func__);
}

- (void)testRunloopTimer{
    CFRunLoopRef loop = CFRunLoopGetCurrent();
//    typedef struct {
//        CFIndex    version;
//        void *    info;
//        const void *(*retain)(const void *info);
//        void    (*release)(const void *info);
//        CFStringRef    (*copyDescription)(const void *info);
//    } CFRunLoopTimerContext;
    CFRunLoopTimerContext context = {0,NULL,NULL,NULL,NULL};
    CFRunLoopTimerRef timer = CFRunLoopTimerCreate(kCFAllocatorDefault, 0.1, 0.5, 0, 0, &timercallback, &context);
    if (CFRunLoopContainsTimer(loop, timer, kCFRunLoopCommonModes) == false) {
        CFRunLoopAddTimer(loop, timer, kCFRunLoopCommonModes);
    }
    const char  * str= [NSDate dateWithTimeIntervalSinceNow:0].description.UTF8String;
    printf("%s", str);
}
void timercallback(){
    static int count = 0;
    const char  * str= [NSDate dateWithTimeIntervalSinceNow:0].description.UTF8String;
    printf(" %s %d\n",str,count++);
}
//主线程启动
- (void)launchThread
{
    NSPort* myPort = [NSMachPort port];
    if (myPort)
    {
        // This class handles incoming port messages.
        [myPort setDelegate:self];
        
        // Install the port as an input source on the current run loop.
        [[NSRunLoop currentRunLoop] addPort:myPort forMode:NSDefaultRunLoopMode];
        
        // Detach the thread. Let the worker release the port.
        [NSThread detachNewThreadSelector:@selector(LaunchThreadWithPort:)
                                 toTarget:self
                               withObject:myPort];
    }
}
- (void)LaunchThreadWithPort:(NSMachPort *)port{
    NSLog(@"port:%d",port.machPort);
}
#define kCheckinMessage 100

// Handle responses from the worker thread.
- (void)handlePortMessage:(NSPortMessage *)portMessage
{
//    unsigned int message = [portMessage ];
//    NSPort* distantPort = nil;
//
//    if (message == kCheckinMessage)
//    {
//        // Get the worker thread’s communications port.
//        distantPort = [portMessage sendPort];
//
//        // Retain and save the worker port for later use.
//        [self storeDistantPort:distantPort];
//    }
//    else
//    {
//        // Handle other messages.
//    }
}

//+(void)LaunchThreadWithPort:(id)inData
//{
//
//    // Set up the connection between this thread and the main thread.
//    NSPort* distantPort = (NSPort*)inData;
//
//    ViewController*  workerObj = [[self alloc] init];
//    [workerObj sendCheckinMessage:distantPort];
//
//    // Let the run loop process things.
//    do
//    {
//        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
//                                 beforeDate:[NSDate distantFuture]];
//    }
//    while (![workerObj shouldExit]);
//
//}
//- (BOOL)shouldExit{
//    return NO;
//}
//- (void)sendCheckinMessage:(NSPort*)outPort
//{
//    // Retain and save the remote port for future use.
//    [self setRemotePort:outPort];
//
//    // Create and configure the worker thread port.
//    NSPort* myPort = [NSMachPort port];
//    [myPort setDelegate:self];
//    [[NSRunLoop currentRunLoop] addPort:myPort forMode:NSDefaultRunLoopMode];
//
//    // Create the check-in message.
//    NSPortMessage* messageObj = [[NSPortMessage alloc] initWithSendPort:outPort
//                                                            receivePort:myPort components:nil];
//
//    if (messageObj)
//    {
//        // Finish configuring the message and send it immediately.
////        [messageObj setMsgId:kCheckinMessage];
////        [messageObj sendBeforeDate:[NSDate date]];
//       BOOL su = [outPort sendBeforeDate:[NSDate date]
//                              components:nil
//                                    from:outPort
//                                reserved:kCheckinMessage];
//        NSLog(@"传输:%d",su);
//    }
//}
//- (void)setRemotePort:(NSPort *)port{
//
//}





#define kThreadStackSize        (8 *4096)
//
//OSStatus MySpawnThread()
//{
//    // Create a local port for receiving responses.
//    CFStringRef myPortName;
//    CFMessagePortRef myPort;
//    CFRunLoopSourceRef rlSource;
//    CFMessagePortContext context = {0, NULL, NULL, NULL, NULL};
//    Boolean shouldFreeInfo;
//
//    // Create a string with the port name.
//    myPortName = CFStringCreateWithFormat(NULL, NULL, CFSTR("com.myapp.MainThread"));
//
//    // Create the port.
//    myPort = CFMessagePortCreateLocal(NULL,
//                                      myPortName,
//                                      &MainThreadResponseHandler,
//                                      &context,
//                                      &shouldFreeInfo);
//
//    if (myPort != NULL)
//    {
//        // The port was successfully created.
//        // Now create a run loop source for it.
//        rlSource = CFMessagePortCreateRunLoopSource(NULL, myPort, 0);
//
//        if (rlSource)
//        {
//            // Add the source to the current run loop.
//            CFRunLoopAddSource(CFRunLoopGetCurrent(), rlSource, kCFRunLoopDefaultMode);
//
//            // Once installed, these can be freed.
//            CFRelease(myPort);
//            CFRelease(rlSource);
//        }
//    }
//
//    // Create the thread and continue processing.
//    MPTaskID        taskID;
//    return(MPCreateTask(&ServerThreadEntryPoint,
//                        (void*)myPortName,
//                        kThreadStackSize,
//                        NULL,
//                        NULL,
//                        NULL,
//                        0,
//                        &taskID));
//}
//#define kCheckinMessage 100
//
//// Main thread port message handler
//CFDataRef MainThreadResponseHandler(CFMessagePortRef local,
//                                    SInt32 msgid,
//                                    CFDataRef data,
//                                    void* info)
//{
//    if (msgid == kCheckinMessage)
//    {
//        CFMessagePortRef messagePort;
//        CFStringRef threadPortName;
//        CFIndex bufferLength = CFDataGetLength(data);
//        UInt8* buffer = CFAllocatorAllocate(NULL, bufferLength, 0);
//
//        CFDataGetBytes(data, CFRangeMake(0, bufferLength), buffer);
//        threadPortName = CFStringCreateWithBytes (NULL, buffer, bufferLength, kCFStringEncodingASCII, FALSE);
//
//        // You must obtain a remote message port by name.
//        messagePort = CFMessagePortCreateRemote(NULL, (CFStringRef)threadPortName);
//
//        if (messagePort)
//        {
//            // Retain and save the thread’s comm port for future reference.
//            AddPortToListOfActiveThreads(messagePort);
//
//            // Since the port is retained by the previous function, release
//            // it here.
//            CFRelease(messagePort);
//        }
//
//        // Clean up.
//        CFRelease(threadPortName);
//        CFAllocatorDeallocate(NULL, buffer);
//    }
//    else
//    {
//        // Process other messages.
//    }
//
//    return NULL;
//}
//
//
//OSStatus ServerThreadEntryPoint(void* param)
//{
//    // Create the remote port to the main thread.
//    CFMessagePortRef mainThreadPort;
//    CFStringRef portName = (CFStringRef)param;
//
//    mainThreadPort = CFMessagePortCreateRemote(NULL, portName);
//
//    // Free the string that was passed in param.
//    CFRelease(portName);
//
//    // Create a port for the worker thread.
//    CFStringRef myPortName = CFStringCreateWithFormat(NULL, NULL, CFSTR("com.MyApp.Thread-%d"), MPCurrentTaskID());
//
//    // Store the port in this thread’s context info for later reference.
//    CFMessagePortContext context = {0, mainThreadPort, NULL, NULL, NULL};
//    Boolean shouldFreeInfo;
//    Boolean shouldAbort = TRUE;
//
//    CFMessagePortRef myPort = CFMessagePortCreateLocal(NULL,
//                                                       myPortName,
//                                                       &ProcessClientRequest,
//                                                       &context,
//                                                       &shouldFreeInfo);
//
//    if (shouldFreeInfo)
//    {
//        // Couldn't create a local port, so kill the thread.
//        MPExit(0);
//    }
//
//    CFRunLoopSourceRef rlSource = CFMessagePortCreateRunLoopSource(NULL, myPort, 0);
//    if (!rlSource)
//    {
//        // Couldn't create a local port, so kill the thread.
//        MPExit(0);
//    }
//
//    // Add the source to the current run loop.
//    CFRunLoopAddSource(CFRunLoopGetCurrent(), rlSource, kCFRunLoopDefaultMode);
//
//    // Once installed, these can be freed.
//    CFRelease(myPort);
//    CFRelease(rlSource);
//
//    // Package up the port name and send the check-in message.
//    CFDataRef returnData = nil;
//    CFDataRef outData;
//    CFIndex stringLength = CFStringGetLength(myPortName);
//    UInt8* buffer = CFAllocatorAllocate(NULL, stringLength, 0);
//
//    CFStringGetBytes(myPortName,
//                     CFRangeMake(0,stringLength),
//                     kCFStringEncodingASCII,
//                     0,
//                     FALSE,
//                     buffer,
//                     stringLength,
//                     NULL);
//
//    outData = CFDataCreate(NULL, buffer, stringLength);
//
//    CFMessagePortSendRequest(mainThreadPort, kCheckinMessage, outData, 0.1, 0.0, NULL, NULL);
//
//    // Clean up thread data structures.
//    CFRelease(outData);
//    CFAllocatorDeallocate(NULL, buffer);
//
//    // Enter the run loop.
//    CFRunLoopRun();
//}







@end
