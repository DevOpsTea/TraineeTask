#Crating network load balancer
resource "aws_lb" "NLB" {
  name                       = "NetworkLoadBalancer"
  internal                   = false
  load_balancer_type         = "network"
  subnets                    = [aws_subnet.psubnet1.id, aws_subnet.psubnet2.id]
  enable_deletion_protection = true
}

#describing Target group for NLB
resource "aws_lb_target_group" "NLBTgroup" {
  name     = "NLBTargetGroup"
  port     = 8080
  protocol = "TCP"
  vpc_id   = aws_vpc.Main_vpc.id
}
#Creaing listener for NLB
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.NLB.arn
  port              = 8080
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.NLBTgroup.arn
  }
}

#attaching target group to instance1
resource "aws_lb_target_group_attachment" "TGInstance1" {
  target_group_arn = aws_lb_target_group.NLBTgroup.arn
  target_id        = aws_instance.vm1.id
  port             = 8080
}
#attaching target group to instance2
resource "aws_lb_target_group_attachment" "TGInstance2" {
  target_group_arn = aws_lb_target_group.NLBTgroup.arn
  target_id        = aws_instance.vm2.id
  port             = 8080
}
