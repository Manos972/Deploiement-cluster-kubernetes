variable "file_access_mode" {
  description = "Permissions for the file in octal representation. For example, '0644' stands for owner-read/write, group-read, and world-read permissions."
  default     = "0400"
}
