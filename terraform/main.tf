terraform {
  required_version = ">= 1.10"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

variable "litellm_api_key" {
  type        = string
  description = "LiteLLM API key (from environment or GitHub secret)"
  sensitive   = true
}

variable "gateway_token" {
  type        = string
  description = "OpenClaw gateway token"
  sensitive   = true
}

variable "discord_token" {
  type        = string
  description = "Discord bot token"
  sensitive   = true
}

variable "guild_id" {
  type        = string
  description = "Discord guild ID"
}

variable "channel_1" { type = string }
variable "channel_2" { type = string }
variable "channel_3" { type = string }
variable "channel_4" { type = string }
variable "channel_5" { type = string }
variable "channel_6" { type = string }
variable "channel_7" { type = string }
variable "channel_8" { type = string }

variable "openclaw_state_dir" {
  type        = string
  description = "Path to OpenClaw state directory"
  default     = "/Users/j/.openclaw"
}

variable "openclaw_workspace" {
  type        = string
  description = "Path to OpenClaw workspace"
  default     = "/Users/j/.openclaw/workspace"
}

module "openclaw" {
  source = "./modules/openclaw"

  litellm_api_key  = var.litellm_api_key
  gateway_token    = var.gateway_token
  discord_token    = var.discord_token
  guild_id         = var.guild_id
  channel_1        = var.channel_1
  channel_2        = var.channel_2
  channel_3        = var.channel_3
  channel_4        = var.channel_4
  channel_5        = var.channel_5
  channel_6        = var.channel_6
  channel_7        = var.channel_7
  channel_8        = var.channel_8
  openclaw_state_dir  = var.openclaw_state_dir
  openclaw_workspace  = var.openclaw_workspace
}

output "openclaw_config_path" {
  value = module.openclaw.openclaw_config_path
}

output "env_file_path" {
  value = module.openclaw.env_file_path
}
