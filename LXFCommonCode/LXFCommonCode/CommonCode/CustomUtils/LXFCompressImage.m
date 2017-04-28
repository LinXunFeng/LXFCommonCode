//
//  LXFCompressImage.m
//  LXFCommonCode
//
//  Created by 林洵锋 on 2017/4/5.
//  Copyright © 2017年 LXF. All rights reserved.
//

#import "LXFCompressImage.h"
#import "LXFLog.h"

@implementation LXFCompressImage

//压缩头像
+(UIImage *)compressHeaderImage:(UIImage *)editedImage{
    UIImage* newImage = editedImage;
    if (editedImage.size.width>140) {
        CGSize newSize = CGSizeMake(140, 140);
        
        UIGraphicsBeginImageContext(newSize);
        // Tell the old image to draw in this new context, with the desired
        // new size
        [newImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
        
        // Get the new image from the context
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        // End the context
        UIGraphicsEndImageContext();
    }
    NSData *imageData = UIImageJPEGRepresentation(newImage, 0.05);
    
    CGFloat  lenth = [imageData length]/1024.0/1024.0;
    LXFLog(@"%f",[UIImagePNGRepresentation(editedImage) length]/1024.0/1024.0);
    LXFLog(@"%f",lenth);
    
    return [UIImage imageWithData:imageData];
}

//压缩图片
+(UIImage *)compressImage:(UIImage *)editedImage{
    UIImage* newImage = editedImage;
    //    CGFloat scale = 0.5;
    CGFloat lenth = [UIImagePNGRepresentation(newImage) length]/1024.0/1024;
    //    if (lenth<2.0){
    //        scale = 0.8f;
    //    }else if (lenth<3.0) {
    //        scale = 0.7f;
    //    }else if (lenth<5.0){
    //        scale = 0.6f;
    //    }else if (lenth<10.0) {
    //        scale = 0.5f;
    //    }else if (lenth<20.0){
    //        scale = 0.4f;
    //    }else if (lenth<50.0){
    //        scale = 0.3f;
    //    }else{
    //        scale = 0.2f;
    //    }
    if (lenth>1.0f&&newImage.size.width>700.0) {
        //        CGSize newSize = CGSizeMake(newImage.size.width*scale, newImage.size.height*scale);
        CGSize newSize = CGSizeMake(700.0, 700.0*newImage.size.height/newImage.size.width);
        
        UIGraphicsBeginImageContext(newSize);
        // Tell the old image to draw in this new context, with the desired
        // new size
        [newImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
        
        // Get the new image from the context
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        // End the context
        UIGraphicsEndImageContext();
    }
    NSData *newData = UIImagePNGRepresentation(newImage);
    float   newSize = [newData length]/1024.0/1024.0;
    LXFLog(@"%f",[UIImagePNGRepresentation(editedImage) length]/1024.0/1024.0);
    LXFLog(@"%f",newSize);
    return newImage;
    //    return [AppUtils reduceImage:newImage lenth:newData.length/1024.0/1024.0];
}
//压缩图片质量
+(UIImage *)reduceImage:(UIImage *)image lenth:(CGFloat)lenth
{
    CGFloat scale = 0.5;
    if (lenth<1.3) {
        return image;
    }else if (lenth<2.0){
        scale = 0.9f;
    }else if (lenth<3.0) {
        scale = 0.8f;
    }else if (lenth<5.0){
        scale = 0.7f;
    }else if (lenth<10.0) {
        scale = 0.6f;
    }else if (lenth<20.0){
        scale = 0.5f;
    }else if (lenth<50.0){
        scale = 0.3f;
    }else{
        scale = 0.1f;
    }
    scale *= .01;
    NSData *imageData = UIImageJPEGRepresentation(image, scale);
    UIImage *newImage = [UIImage imageWithData:imageData];
    LXFLog(@"%f",lenth);
    LXFLog(@"%f",scale);
    LXFLog(@"%f",imageData.length/1024.0/1024.0);
    return newImage;
}

@end
