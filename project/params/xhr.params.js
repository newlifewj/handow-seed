'use strict';

/**
 * Global parameters for HTTP and XHR
 */

module.exports = {
    HTTP200: 200,
    HTTP201: 201,
    HTTP400: 400,
    HTTP401: 401,
    HTTP403: 403,
    HTTP404: 404,
    HTTP500: 500,
    // It is a axios config object, consumed by axios.request(config) API
    // https://github.com/axios/axios
    Get_Lab_Version_XHR: {
        method: "GET", 
        url: "/version.json"
    },

    Post_Reset_User_XHR: {
        method: "POST",
        url: "reqres.in/api/users"
    },

    More_Doc_XHR: {
        method: "GET",
        url: "/documents/Not_Exist"
    },

    GetVersionAPI: {
        method: "GET",
        url: "/info",
        baseURL: "https://localhost:8080/api",
        params: {
            page: 1,
            size: 25
        },
        headers: {
            'X-Requested-With': 'XMLHttpRequest'
        }
    },

    GetVersionData: {
        data: {
            session: {
                profile: "Admain User111"
            }
        },
        status: {
            statusCode: 200000
        }
    },

    Handow_Version_Data: {
        handowCore: {
            version: "v0.3.2"
        }
    },

    WrongURLAPI: {
        method: "GET",
        url: "/notexisted",
        baseURL: "https://localhost:8080/api",
        params: {
            page: 1,
            size: 25
        },
        headers: {
            'X-Requested-With': 'XMLHttpRequest'
        }
    },

    XHR_Get_Version: {
        method: "GET",
        url: "/version.json",
        baseURL: "http://www.handow.org",
        headers: {
            'X-Requested-With': 'XMLHttpRequest'
        }
    },

    XHR_Post_User: {
        method: "POST",
        url: "/api/users",
        baseURL: "https://reqres.in",
        headers: {
            'X-Requested-With': 'XMLHttpRequest'
        },
        data: {
            "username": "Jack Smith",
            "email": "Jack@gmail.com",
            "level": 0
        }
    },

    XHR_Get_Users: {
        method: "GET",
        url: "/api/users",
        baseURL: "https://reqres.in",
        headers: {
            'X-Requested-With': 'XMLHttpRequest'
        }
    },

    XHR_Doc_Getting_Start: {
        method: "GET",
        url: "/documents/Getting_Start.md",
    },

    WrongURLResponse: {
        status: {
            statusCode: 404000
        }
    },

    UpdateProfileAPI: {
        method: "PUT",
        url: "/profile",
        data: {
            username: "Mark"
        }
    },
    
    Get_SHM_Config: {
        method: "GET",
        url: "/api/shm"
    },
    
    SHM_Info: {
        method: "GET",
        url: "/api/info"
    }
    
};