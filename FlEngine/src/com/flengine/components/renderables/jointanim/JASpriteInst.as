﻿package com.flengine.components.renderables.jointanim
{
    import __AS3__.vec.*;

    public class JASpriteInst extends Object
    {
        public var parent:JASpriteInst;
        public var delayFrames:int;
        public var frameNum:Number;
        public var lastFrameNum:Number;
        public var frameRepeats:int;
        public var onNewFrame:Boolean;
        public var lastUpdated:int;
        public var curTransform:JATransform;
        public var curColor:JAColor;
        public var children:Vector.<JAObjectInst>;
        public var spriteDef:JASpriteDef;

        public function JASpriteInst()
        {
            children = new Vector.<JAObjectInst>;
            curTransform = new JATransform();
            spriteDef = null;
            return;
        }// end function

        public function Dispose() : void
        {
            var _loc_1:* = 0;
            _loc_1 = 0;
            while (_loc_1 < children.length)
            {
                
                children[_loc_1].Dispose();
                _loc_1++;
            }
            children.splice(0, children.length);
            children = null;
            curTransform = null;
            spriteDef = null;
            curColor = null;
            return;
        }// end function

        public function Reset() : void
        {
            var _loc_1:* = 0;
            _loc_1 = 0;
            while (_loc_1 < children.length)
            {
                
                children[_loc_1].Dispose();
                _loc_1++;
            }
            children.splice(0, children.length);
            return;
        }// end function

    }
}
