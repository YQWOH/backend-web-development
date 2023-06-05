class HealthController {
    getHealthCheck(req, res) {
        return res.status(200).json({
            name: "shop-clone-api",
            version: "V1",
            date: Date.now()
        })
    }
}

export default new HealthController();