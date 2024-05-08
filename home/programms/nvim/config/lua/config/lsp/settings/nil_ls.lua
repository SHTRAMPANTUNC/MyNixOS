return {
    settings = {
        ['nil'] = {
            formatting = {
                command = { 'alejandra' },
            },
            nix = {
                flake = {
                    autoArchive = true,
                    autoEvalInputs = true,
                },
           },
        },
    },
}
