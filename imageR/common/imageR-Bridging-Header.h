//
//  imageR-Bridging-Header.h
//  imageR
//
//  Created by Sayeed Munawar Hussain on 29/01/17.
//  Copyright © 2017 *. All rights reserved.
//

#ifndef imageR_Bridging_Header_h
#define imageR_Bridging_Header_h

#include <stdint.h>
extern uint64_t dispatch_benchmark(size_t count, void (^block)(void));

#import "INVector3.h"
#import "ColorSpaceConversion.h"

#endif /* imageR_Bridging_Header_h */
