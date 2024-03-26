export interface PageRequest {
  pageSize: number;
  pageNumber: number;
}

export interface SearchRequest extends PageRequest {
    value: string;
}

export interface Pageable {
  pageNumber: number;
  pageSize: number;
  sort: {
    empty: boolean;
    sorted: boolean;
    unsorted: boolean;
  };
  offset: number;
  paged: boolean;
  unpaged: boolean;
}

export interface ResponseData {
  timestamp: string;
  messageCode: string;
  message: string;
  data: {
    content: any[];
    pageable: Pageable;
    last: boolean;
    totalElements: number;
    totalPages: number;
    size: number;
    number: number;
    sort: {
      empty: boolean;
      sorted: boolean;
      unsorted: boolean;
    };
    numberOfElements: number;
    first: boolean;
    empty: boolean;
  };
}
