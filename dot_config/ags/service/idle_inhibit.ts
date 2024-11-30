class IdleInhibit extends Service {
  static {
    Service.register(this, {}, { "inhibit-status": ["boolean", "rw"] });
  }

  #inhibitStatus = false;

  get inhibit_status() {
    return this.#inhibitStatus;
  }

  toggle_inhibit() {
    this.#inhibitStatus = !this.#inhibitStatus;
    this.changed("inhibit-status");
    if (this.#inhibitStatus) {
      Utils.execAsync("sh -c 'pkill hypridle'");
    } else {
      Utils.execAsync("sh -c 'pidof hypridle || hypridle'");
    }
  }

  constructor() {
    super();
    Utils.execAsync("sh -c 'pidof hypridle || hypridle'");
  }
}

export default new IdleInhibit();
