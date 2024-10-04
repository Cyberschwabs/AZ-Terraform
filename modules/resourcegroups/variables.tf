variable "resourcegroups" {
    type = map(object({
        name = string
        location = string
    }))
}