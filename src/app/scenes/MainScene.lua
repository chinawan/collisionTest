
local MainScene = class("MainScene", function()
    return display.newPhysicsScene("MainScene")
end)
IMG1_TAG   = 1  --player
IMG2_TAG    = 2  --bullet
IMG3_TAG     = 3  --zuan
IMG4_TAG  = 4   --daoju
-- IMG5_TAG   = 5  --zhangai
--1和2不碰撞 和其他碰撞
--2和3碰撞 和其他不碰撞

function MainScene:ctor()
	self.world = self:getPhysicsWorld()
    self.world:setGravity(cc.p(0, 0))
    self.world:setDebugDrawMask(cc.PhysicsWorld.DEBUGDRAW_ALL)
    self:IMG1()
    self:IMG2()
    self:IMG3()
    self:IMG4()
    self:addCollision()
end

function MainScene:addCollision()

    local function contactLogic(node)
        if node:getTag() == IMG2_TAG then
            print("222222222222")
        elseif node:getTag() == IMG3_TAG then
            print("3333333333333333")
        elseif node:getTag() == IMG4_TAG then
            print("44444444444444")
        end
    end

    local function onContactBegin(contact)
        local a = contact:getShapeA():getBody():getNode()
        local b = contact:getShapeB():getBody():getNode()


        contactLogic(a)
        contactLogic(b)

        return true
    end
    
    local contactListener = cc.EventListenerPhysicsContact:create()
    contactListener:registerScriptHandler(onContactBegin, cc.Handler.EVENT_PHYSICS_CONTACT_BEGIN)
    -- contactListener:registerScriptHandler(onContactSeperate, cc.Handler.EVENT_PHYSICS_CONTACT_SEPERATE)
    local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
    eventDispatcher:addEventListenerWithFixedPriority(contactListener, 1)
end

function MainScene:IMG1()
	self.img1 = display.newSprite("item_6.png"):pos(display.cx-400,display.cy):addTo(self)
	local body = cc.PhysicsBody:createCircle(65)
    body:setCategoryBitmask(0x0011)
    body:setContactTestBitmask(0x0011)
    body:setCollisionBitmask(0x1000)
    self.img1:setTag(IMG1_TAG)
    self.img1:setPhysicsBody(body)

	self.img1:setTouchEnabled(true)
	self.img1:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
		local x, y, prevX, prevY = event.x, event.y, event.prevX, event.prevY
        if event.name == "began" then
           
        elseif event.name == "moved" then
            self.img1:setPosition(x,y)
        elseif event.name == "ended" then

       	end
       	return true
    end)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
end

function MainScene:IMG2()
    self.img2 = display.newSprite("item_7.png"):pos(display.cx-200,display.cy):addTo(self)
    local body = cc.PhysicsBody:createCircle(65)
    body:setCategoryBitmask(0x0100)
    body:setContactTestBitmask(0x0100)
    body:setCollisionBitmask(0x1000)
    self.img2:setTag(IMG2_TAG)
    self.img2:setPhysicsBody(body)
    self.img2:setTouchEnabled(true)
	self.img2:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
		local x, y, prevX, prevY = event.x, event.y, event.prevX, event.prevY
        if event.name == "began" then
           
        elseif event.name == "moved" then
            self.img2:setPosition(x,y)
        elseif event.name == "ended" then

       	end
       	return true
    end)
end

function MainScene:IMG3()
    self.img3 = display.newSprite("item_8.png"):pos(display.cx,display.cy):addTo(self)
    local body = cc.PhysicsBody:createCircle(65)
    body:setCategoryBitmask(0x0101)
    body:setContactTestBitmask(0x0101)
    body:setCollisionBitmask(0x1000)
    self.img3:setTag(IMG3_TAG)
    self.img3:setPhysicsBody(body)
    self.img3:setTouchEnabled(true)
	self.img3:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
		local x, y, prevX, prevY = event.x, event.y, event.prevX, event.prevY
        if event.name == "began" then
           
        elseif event.name == "moved" then
            self.img3:setPosition(x,y)
        elseif event.name == "ended" then

       	end
       	return true
    end)
end

function MainScene:IMG4()
    self.img4 = display.newSprite("item_9.png"):pos(display.cx+200,display.cy):addTo(self)
    local body = cc.PhysicsBody:createCircle(65)
    body:setCategoryBitmask(0x0010)
    body:setContactTestBitmask(0x0010)
    body:setCollisionBitmask(0x1000)
    self.img4:setTag(IMG4_TAG)
    self.img4:setPhysicsBody(body)
    self.img4:setTouchEnabled(true)
	self.img4:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
		local x, y, prevX, prevY = event.x, event.y, event.prevX, event.prevY
        if event.name == "began" then
           
        elseif event.name == "moved" then
            self.img4:setPosition(x,y)
        elseif event.name == "ended" then

       	end
       	return true
    end)
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
