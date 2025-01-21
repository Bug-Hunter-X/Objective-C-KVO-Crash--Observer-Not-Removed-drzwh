The solution involves ensuring that the observer is removed using `removeObserver:forKeyPath:` in the appropriate method, such as `dealloc` or a cleanup method before the observed object is deallocated.  This prevents the retain cycle and allows the object to be garbage collected.  Additionally, using `weak` references for observers can help prevent this issue entirely, though `removeObserver` is still a best practice.

```objectivec
@interface MyObservedObject : NSObject
@property (nonatomic, strong) NSString *observedProperty;
@end

@implementation MyObservedObject
- (void)dealloc {
    [self removeObserver:self forKeyPath:@