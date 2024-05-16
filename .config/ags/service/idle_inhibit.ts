class IdleInhibit extends Service {
    static {
        Service.register(this, {}, { "inhibit-status": ["boolean", "rw"] });
    }

    #inhibit = Utils.exec("sh -c 'systemd-inhibit sleep 5'");
    #sleep = Utils.exec("sh -c 'sleep 5'");
    #inhibit_status = false;

    toggle_inhibit() {
        this.#inhibit_status = !this.#inhibit_status;
    }

    #inhibit_loop() {
        if (this.#inhibit_status) {
            this.#inhibit;
        } else {
            this.#sleep;
        }
    }

    constructor() {
        super();
    }
}

export default new IdleInhibit();
