Shiny.addCustomMessageHandler(
  "shinynotyf",
  function(opts) {
    const notyf = new Notyf({
      types: [
        {
          type: 'custom',
          backgroundColor: opts.color,
          ripple: opts.ripple,
          icon: {
            className: 'material-icons',
            tagName: 'i',
            text: opts.icon
          }
        },
        {
          type: 'success',
          className: 'notyf__toast--success',
          backgroundColor: '#3dc763',
          icon: {
            className: 'notyf__icon--success',
            tagName: 'i',
          }
        },
        {
          type: 'error',
          className: 'notyf__toast--error',
          backgroundColor: '#ed3d3d',
          icon: {
            className: 'notyf__icon--error',
            tagName: 'i',
          }
        }
      ]
    });

    notyf.open({
      type: opts.type,
      message: opts.message,
      duration: opts.duration
    });
  }
);
