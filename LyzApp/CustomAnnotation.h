//
//  CustomAnnotation.h
//  LyzApp
//
//  Created by Galileo Guzman on 14/04/15.
//  Copyright (c) 2015 Galileo Guzman. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface CustomAnnotation : NSObject  <MKAnnotation> {
    
    // Creamos un título
    NSString *title;
    // Declaramos un subtítulo
    NSString *subtitle;
    // Y una coordenada
    CLLocationCoordinate2D coordinate;
    
}

// Definimos sus propiedades
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

// Y el método de inicialización
- (id)initWithTitle:(NSString *)aTitle subtitle:(NSString*)aSubtitle andCoordinate:(CLLocationCoordinate2D)coord;
- (id)initWithCordinate:(CLLocationCoordinate2D)coord;

@end
