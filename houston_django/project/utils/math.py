def clamp(value, minimum, maximum):
    return max(
        min(value, maximum),
        minimum,
    )
