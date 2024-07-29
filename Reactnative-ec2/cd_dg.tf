resource "aws_codedeploy_app" "demo_app" {
  name             = "demo_app"
  compute_platform = "Server"
}

resource "aws_sns_topic" "demo_sns_topic" {
  name = "demo_sns_topic"
}

resource "aws_codedeploy_deployment_config" "demo_config" {
  deployment_config_name = "CodeDeployDefault2.EC2AllAtOnce"
  
  #traffic_routing_config {
  #  type = "AllAtOnce"
  #}
  # Terraform: Should be "null" for EC2/Server

  minimum_healthy_hosts {
    type  = "HOST_COUNT"
    value = 0
  }
}

resource "aws_codedeploy_deployment_group" "cd_dg1" {
  app_name              = aws_codedeploy_app.demo_app.name
  deployment_group_name = "cd_dg1"
  service_role_arn      = aws_iam_role.devops_codedeploy_role.arn


  trigger_configuration {
    trigger_events = ["DeploymentFailure", "DeploymentSuccess", "DeploymentFailure", "DeploymentStop",
    "InstanceStart", "InstanceSuccess", "InstanceFailure"]
    trigger_name       = "event-trigger"
    trigger_target_arn = aws_sns_topic.demo_sns_topic.arn
  }

  auto_rollback_configuration {
    enabled = false
    events  = ["DEPLOYMENT_FAILURE"]
  }

  alarm_configuration {
    alarms  = ["my-alarm-name"]
    enabled = true
  }

  load_balancer_info {
    target_group_info {
      name = aws_lb_target_group.external_alb_tg_app1.name
    }
  }

  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "IN_PLACE"
  }

  autoscaling_groups = [aws_autoscaling_group.devops_web_asg.id]
}



#EC2 Code deploy role
resource "aws_iam_role" "devops_ec2codedeploy_role" {
  name = "devops2_ec2codedeploy_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    Name = "devops_ec2codedeploy_role"
  }

}


resource "aws_iam_role_policy_attachment" "ec2_fullaccess_attach" {
  role       = aws_iam_role.devops_ec2codedeploy_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_role_policy_attachment" "ec2_s3fullaccess_attach" {
  role       = aws_iam_role.devops_ec2codedeploy_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}


#AWS Code Deploy Role

resource "aws_iam_role" "devops_codedeploy_role" {
  name = "devops2_codedeploy_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "codedeploy.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  tags = {
    Name = "devops_codedeploy_role"
  }

}

resource "aws_iam_role_policy_attachment" "codedeploy_attach" {
  role       = aws_iam_role.devops_codedeploy_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
  
}

resource "aws_iam_instance_profile" "ec2_cd_instance_profile" {
  name = "ec2_cd_instance_profile"
  role = aws_iam_role.devops_ec2codedeploy_role.name
}

